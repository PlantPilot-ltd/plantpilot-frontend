import 'package:core/core.dart';

class BluetoothNotSupportedError extends AppException {
  const BluetoothNotSupportedError()
      : super('Bluetooth not supported by this device');
}

class BluetoothDisabledError extends AppException {
  const BluetoothDisabledError() : super('Bluetooth is currently disabled');
}

class BluetoothNoConnectionError extends AppException {
  const BluetoothNoConnectionError()
      : super('Bluetooth device is not connected');
}

class BluetoothNoCharacteristicError extends AppException {
  final String uuid;
  const BluetoothNoCharacteristicError(this.uuid)
      : super(
          'Bluetooth device doesn\'t have the required characteristic with uuid: $uuid',
        );
}
