import 'package:equatable/equatable.dart';

class BluetoothConfiguration extends Equatable {
  final String serviceUUID;
  final String sendCharacteristicUUID;
  final String receiveCharacteristicUUID;
  final Duration dataReceiveTick;

  const BluetoothConfiguration({
    required this.serviceUUID,
    required this.sendCharacteristicUUID,
    required this.receiveCharacteristicUUID,
    this.dataReceiveTick = const Duration(milliseconds: 2000),
  });

  const BluetoothConfiguration.test()
      : serviceUUID = '5471482b-7286-4748-9c0a-7c96ffb2b94f',
        sendCharacteristicUUID = '95fec53e-e898-42b1-865f-86cd3e8beb70',
        receiveCharacteristicUUID = 'cf074f53-fa00-4025-9c48-619ea024ffc7',
        dataReceiveTick = const Duration(milliseconds: 2000);

  @override
  List<Object?> get props => [
        serviceUUID,
        sendCharacteristicUUID,
        receiveCharacteristicUUID,
      ];
}
