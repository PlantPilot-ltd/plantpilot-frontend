import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class GreenhouseEntity extends Equatable {
  final String remoteId;
  final String name;

  const GreenhouseEntity({
    required this.remoteId,
    required this.name,
  });

  factory GreenhouseEntity.fromCache(GreenhouseCacheModel model) =>
      GreenhouseEntity(
        remoteId: model.remoteId,
        name: model.name,
      );

  GreenhouseCacheModel toCache() => GreenhouseCacheModel(
        remoteId: remoteId,
        name: name,
      );

  BluetoothDeviceModel toBluetoothModel() => BluetoothDeviceModel(
        remoteId: remoteId,
        advName: name,
      );

  @override
  List<Object?> get props => [remoteId, name];
}
