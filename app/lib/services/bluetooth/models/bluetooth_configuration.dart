import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class BluetoothConfigurationModel extends Equatable {
  final String serviceUUID;
  final String sendCharacteristicUUID;
  final String receiveCharacteristicUUID;
  final Duration dataReceiveTick;
  final Duration connectionTimeout;

  const BluetoothConfigurationModel({
    required this.serviceUUID,
    required this.sendCharacteristicUUID,
    required this.receiveCharacteristicUUID,
    required this.dataReceiveTick,
    required this.connectionTimeout,
  });

  factory BluetoothConfigurationModel.fromEnvironment(
    EnvironmentType? envType,
  ) {
    switch (envType) {
      case EnvironmentType.production:
        return const BluetoothConfigurationModel.prod();
      case EnvironmentType.development:
      case EnvironmentType.mock:
      default:
        return const BluetoothConfigurationModel.dev();
    }
  }

  const BluetoothConfigurationModel.dev()
      : serviceUUID = '5471482b-7286-4748-9c0a-7c96ffb2b94f',
        sendCharacteristicUUID = '95fec53e-e898-42b1-865f-86cd3e8beb70',
        receiveCharacteristicUUID = 'cf074f53-fa00-4025-9c48-619ea024ffc7',
        dataReceiveTick = const Duration(milliseconds: 2000),
        connectionTimeout = const Duration(milliseconds: 10000);

  const BluetoothConfigurationModel.prod()
      : serviceUUID = '5471482b-7286-4748-9c0a-7c96ffb2b94f',
        sendCharacteristicUUID = '95fec53e-e898-42b1-865f-86cd3e8beb70',
        receiveCharacteristicUUID = 'cf074f53-fa00-4025-9c48-619ea024ffc7',
        dataReceiveTick = const Duration(milliseconds: 2000),
        connectionTimeout = const Duration(milliseconds: 10000);

  @override
  List<Object?> get props => [
        serviceUUID,
        sendCharacteristicUUID,
        receiveCharacteristicUUID,
      ];
}
