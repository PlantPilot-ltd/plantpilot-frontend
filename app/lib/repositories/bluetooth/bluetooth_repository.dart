import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

part 'bluetooth_repository.g.dart';

class BluetoothRepository = _BluetoothRepository with _$BluetoothRepository;

abstract class _BluetoothRepository extends VPDDataStore with Store {
  @observable
  BluetoothStateEntity? bluetoothState;
  @observable
  BluetoothScanningStateEntity? scanningState;
  @observable
  List<BluetoothScanResultEntity> lastScanResults = [];

  late final BluetoothService _bluetoothService;

  final Debouncer _stopScanDebouncer =
      Debouncer(delay: const Duration(seconds: 5));

  _BluetoothRepository({
    required LogService logger,
    required BluetoothConfigurationModel config,
  }) {
    _bluetoothService = BluetoothService(
      logger: logger,
      config: config,
      onBluetoothStateChange: _onBluetoothStateChange,
      onScanningStateChange: _onScanningStateChange,
      onScanResultsChange: _onScanResultsChange,
    );
  }

  @override
  void dispose() {
    _bluetoothService.dispose();
  }

  void _onBluetoothStateChange(BluetoothStateModel state) {
    bluetoothState = BluetoothStateEntity.fromModel(state);
  }

  void _onScanningStateChange(BluetoothScanningStateModel state) {
    scanningState = BluetoothScanningStateEntity.fromModel(state);
  }

  void _onScanResultsChange(List<BluetoothScanResultModel> results) {
    lastScanResults = [
      ...results.map(BluetoothScanResultEntity.fromModel),
      ..._bluetoothService
          .getConnectedDevices()
          .map(BluetoothScanResultEntity.fromConnectedDevice),
    ];
  }

  void tryTurnOnBluetooth() {
    _bluetoothService.tryTurnOnBluetooth();
  }

  void startScanningForDevices() {
    if (scanningState == BluetoothScanningStateEntity.scanning) {
      return;
    }
    _stopScanDebouncer.dispose();
    _bluetoothService.startScanningForDevices();
    lastScanResults = _bluetoothService
        .getConnectedDevices()
        .map(BluetoothScanResultEntity.fromConnectedDevice)
        .toList();
  }

  void stopScanningForDevices() {
    _stopScanDebouncer.run(
      _bluetoothService.stopScanningForDevices,
    );
  }

  ///
  /// Repository helpers
  ///

  BluetoothDeviceEntity? getScannedDeviceById(String id) {
    return lastScanResults
        .firstWhereOrNull((element) => element.device.remoteId == id)
        ?.device;
  }
}
