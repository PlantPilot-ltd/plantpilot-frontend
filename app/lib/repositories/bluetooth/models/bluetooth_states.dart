import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

enum BluetoothState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off
}

extension BluetoothStateExtension on BluetoothState {
  static BluetoothState fromBlModel(bl.BluetoothAdapterState model) {
    return switch (model) {
      (bl.BluetoothAdapterState.unknown) => BluetoothState.unknown,
      (bl.BluetoothAdapterState.unavailable) => BluetoothState.unavailable,
      (bl.BluetoothAdapterState.unauthorized) => BluetoothState.unauthorized,
      (bl.BluetoothAdapterState.turningOn) => BluetoothState.turningOn,
      (bl.BluetoothAdapterState.on) => BluetoothState.on,
      (bl.BluetoothAdapterState.turningOff) => BluetoothState.turningOff,
      (bl.BluetoothAdapterState.off) => BluetoothState.off,
    };
  }
}

enum BluetoothScanningState { idle, scanning }

enum BluetoothConnectionState { connecting, disconnected, connected }

extension BluetoothConnectionStateExtension on BluetoothConnectionState {
  static BluetoothConnectionState fromBlModel(
    bl.BluetoothConnectionState model,
  ) {
    return switch (model) {
      (bl.BluetoothConnectionState.disconnected) =>
        BluetoothConnectionState.disconnected,
      (bl.BluetoothConnectionState.connected) =>
        BluetoothConnectionState.connected,
      (_) => BluetoothConnectionState.disconnected,
    };
  }
}
