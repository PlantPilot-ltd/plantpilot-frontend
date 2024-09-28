import 'dart:async';
import 'dart:io';

import 'package:app/repositories/index.dart';
import 'package:app/services/index.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:ui_core/ui_core.dart';

part 'bluetooth_repository.g.dart';

class BluetoothRepository = _BluetoothRepository with _$BluetoothRepository;

abstract class _BluetoothRepository extends VPDDataStore with Store {
  final LogService _logger;
  final BluetoothConfiguration _config;

  ///
  /// Bluetooth state
  ///
  @observable
  late BluetoothState bluetoothState = BluetoothStateExtension.fromBlModel(
    bl.FlutterBluePlus.adapterStateNow,
  );

  @observable
  late BluetoothScanningState scanningState = bl.FlutterBluePlus.isScanningNow
      ? BluetoothScanningState.scanning
      : BluetoothScanningState.idle;

  @observable
  List<BluetoothScanResult> scanResults = [];

  @observable
  BluetoothConnection? deviceConnection;
  @observable
  BluetoothData? deviceConnectionData;
  bl.BluetoothCharacteristic? _deviceReceiveChar;
  bl.BluetoothCharacteristic? _deviceSendChar;

  Timer? _dataListenerTimer;

// TODO: Implement initialization
  _BluetoothRepository({
    required LogService logger,
    required BluetoothConfiguration config,
  })  : _logger = logger,
        _config = config {
    _bluetoothStateSubscription =
        bl.FlutterBluePlus.adapterState.listen(_onBluetoothStateChange);
    _scanningStateSubscription =
        bl.FlutterBluePlus.isScanning.listen(_onScanningStateChange);
    _scanResultsSubscription =
        bl.FlutterBluePlus.scanResults.listen(_onScanResultsChange);
  }

  @override
  void dispose() {
    _bluetoothStateSubscription.cancel();
    _scanningStateSubscription.cancel();
    _scanResultsSubscription.cancel();
    _deviceConnectionStateSubscription?.cancel();
  }

  ///
  /// Status listeners
  ///

  late final StreamSubscription _bluetoothStateSubscription;
  late final StreamSubscription _scanningStateSubscription;
  late final StreamSubscription _scanResultsSubscription;
  StreamSubscription? _deviceConnectionStateSubscription;

  void _onBluetoothStateChange(bl.BluetoothAdapterState state) {
    final newState = BluetoothStateExtension.fromBlModel(state);
    if (bluetoothState == BluetoothState.on && newState != BluetoothState.on) {
      stopScanningForDevices();
      disconnectDevice();
    }
    bluetoothState = newState;
  }

  void _onScanningStateChange(bool state) {
    scanningState =
        state ? BluetoothScanningState.scanning : BluetoothScanningState.idle;
  }

  void _onScanResultsChange(List<bl.ScanResult> results) {
    scanResults =
        results.map((e) => BluetoothScanResult.fromBlModel(e)).toList();
  }

  ///
  /// General bluetooth actions
  ///

  /// Try turn on Bluetooth
  Future<VoidThrowableResponse> tryTurnOnBluetooth() async {
    try {
      final bool isSupported = await bl.FlutterBluePlus.isSupported;
      if (isSupported == false) {
        bluetoothState = BluetoothState.unknown;
        return _logException(const BluetoothNotSupportedError());
      }
      if (bluetoothState == BluetoothState.on) {
        return VoidThrowableResponse.success();
      }
      if (Platform.isAndroid) {
        await bl.FlutterBluePlus.turnOn();
      } else {
        return _logException(const BluetoothDisabledError());
      }
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }

    if (bluetoothState == BluetoothState.on) {
      return VoidThrowableResponse.success();
    } else {
      return _logException(const BluetoothDisabledError());
    }
  }

  /// Start scanning for devices
  VoidThrowableResponse startScanningForDevices() {
    try {
      bl.FlutterBluePlus.startScan(
        withServices: [bl.Guid(_config.serviceUUID)],
      );
      return VoidThrowableResponse.success();
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }
  }

  /// Stop scanning for devices
  VoidThrowableResponse stopScanningForDevices() {
    try {
      bl.FlutterBluePlus.stopScan();
      return VoidThrowableResponse.success();
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }
  }

  ///
  /// Device connection
  ///

  /// Connect to [device]
  Future<VoidThrowableResponse> connectToDevice(BluetoothDevice device) async {
    try {
      await disconnectDevice();
      final blDevice = device.toBlModel();

      _deviceConnectionStateSubscription?.cancel();
      deviceConnection = BluetoothConnection.connecting(device);
      await blDevice.discoverServices();
      _deviceReceiveChar =
          _getCharacteristics(blDevice, _config.receiveCharacteristicUUID);
      _deviceSendChar =
          _getCharacteristics(blDevice, _config.sendCharacteristicUUID);
      _deviceConnectionStateSubscription = blDevice.connectionState.listen(
        _onDeviceConnectionStateChange,
      );
      if (_deviceConnectionStateSubscription != null) {
        blDevice.cancelWhenDisconnected(
          _deviceConnectionStateSubscription!,
          delayed: true,
          next: true,
        );
      }
      await blDevice.connect();
      return VoidThrowableResponse.success();
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }
  }

  void _onDeviceConnectionStateChange(bl.BluetoothConnectionState state) {
    if (deviceConnection == null) return;

    final newState = BluetoothConnectionStateExtension.fromBlModel(state);

    /// If device is disconnected, process disconnection
    if (newState == BluetoothConnectionState.disconnected) {
      _processDisonnection();
      return;
    }

    /// If device is connected, start data listener
    if (newState == BluetoothConnectionState.connected &&
        deviceConnection!.state != newState) {
      _startDataListener();
    }
    deviceConnection = deviceConnection?.copyWith(state: Optional(newState));
  }

  /// Disconnect from [device]
  Future<VoidThrowableResponse> disconnectDevice() async {
    if (deviceConnection == null) return VoidThrowableResponse.success();
    try {
      final blDevice = deviceConnection!.device.toBlModel();
      await blDevice.disconnect();
      _processDisonnection();
      return VoidThrowableResponse.success();
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }
  }

  void _processDisonnection() {
    _stopDataListener();
    _deviceConnectionStateSubscription?.cancel();
    deviceConnection = null;
    _deviceReceiveChar = null;
    _deviceSendChar = null;
  }

  ///
  /// Device communication
  ///

  bl.BluetoothCharacteristic? _getCharacteristics(
    bl.BluetoothDevice device,
    String uuid,
  ) {
    for (var service in device.servicesList) {
      for (var characteristic in service.characteristics) {
        if (characteristic.uuid.toString() == uuid) {
          return characteristic;
        }
      }
    }
    return null;
  }

  /// Send data to device
  ///
  /// Maximum size of data is 512 bytes
  Future<VoidThrowableResponse> sendDataToDevice<T>({
    required T model,
    required BluetoothEncoder<T> encoder,
    int timeout = 15,
  }) async {
    if (deviceConnection == null) {
      return _logException(const BluetoothNoConnectionError());
    }
    try {
      final blDevice = deviceConnection!.device.toBlModel();

      _deviceSendChar ??=
          _getCharacteristics(blDevice, _config.sendCharacteristicUUID);
      if (_deviceSendChar == null) {
        return _logException(
            BluetoothNoCharacteristicError(_config.sendCharacteristicUUID));
      }

      await _deviceSendChar!.write(
        encoder(model),
        timeout: timeout,
      );
      return VoidThrowableResponse.success();
    } catch (e, s) {
      return _logException(AppException.fromException(e, s));
    }
  }

  void _startDataListener() {
    _stopDataListener();
    _dataListenerTimer = Timer.periodic(
      _config.dataReceiveTick,
      (_) => _onDataCaptureTick(),
    );
  }

  void _stopDataListener() {
    _dataListenerTimer?.cancel();
    _dataListenerTimer = null;
    deviceConnectionData = null;
  }

  Future<void> _onDataCaptureTick() async {
    try {
      final blDevice = deviceConnection?.device.toBlModel();
      if (blDevice == null) {
        _stopDataListener();
        return;
      }
      _deviceReceiveChar ??=
          _getCharacteristics(blDevice, _config.sendCharacteristicUUID);
      if (_deviceReceiveChar == null) {
        _stopDataListener();
        return;
      }
      final data = await _deviceReceiveChar!.read();
      deviceConnectionData = BluetoothData(
        data: data,
        timeStamp: DateTime.now(),
      );
    } catch (e, s) {
      _logException(AppException.fromException(e, s));
    }
  }

  ///
  /// Repository helpers
  ///

  BluetoothDevice? getScannedDeviceById(String id) {
    return scanResults
        .firstWhereOrNull((element) => element.device.remoteId == id)
        ?.device;
  }

  VoidThrowableResponse _logException(AppException e) {
    _logger.logException(e, e.stackTrace);
    return VoidThrowableResponse.failure(e);
  }
}
