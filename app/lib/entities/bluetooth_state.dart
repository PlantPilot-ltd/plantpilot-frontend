import 'package:app/services/index.dart';

enum BluetoothStateEntity {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off;

  static BluetoothStateEntity fromModel(BluetoothStateModel model) {
    return switch (model) {
      BluetoothStateModel.unknown => BluetoothStateEntity.unknown,
      BluetoothStateModel.unavailable => BluetoothStateEntity.unavailable,
      BluetoothStateModel.unauthorized => BluetoothStateEntity.unauthorized,
      BluetoothStateModel.turningOn => BluetoothStateEntity.turningOn,
      BluetoothStateModel.on => BluetoothStateEntity.on,
      BluetoothStateModel.turningOff => BluetoothStateEntity.turningOff,
      BluetoothStateModel.off => BluetoothStateEntity.off,
    };
  }
}

enum BluetoothScanningStateEntity {
  idle,
  scanning;

  static BluetoothScanningStateEntity fromModel(
    BluetoothScanningStateModel model,
  ) {
    return switch (model) {
      BluetoothScanningStateModel.idle => BluetoothScanningStateEntity.idle,
      BluetoothScanningStateModel.scanning =>
        BluetoothScanningStateEntity.scanning,
    };
  }
}

enum BluetoothConnectionStateEntity {
  connecting,
  disconnected,
  connected;

  bool get isConnected => this != BluetoothConnectionStateEntity.disconnected;
  bool get isDisconnected =>
      this == BluetoothConnectionStateEntity.disconnected;

  static BluetoothConnectionStateEntity fromModel(
    BluetoothConnectionStateModel model,
  ) {
    return switch (model) {
      BluetoothConnectionStateModel.connecting =>
        BluetoothConnectionStateEntity.connecting,
      BluetoothConnectionStateModel.disconnected =>
        BluetoothConnectionStateEntity.disconnected,
      BluetoothConnectionStateModel.connected =>
        BluetoothConnectionStateEntity.connected,
    };
  }
}
