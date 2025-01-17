import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class GreenhouseEntity extends Equatable {
  final String remoteId;
  final String name;

  final List<PlantEntity> plants;

  const GreenhouseEntity({
    required this.remoteId,
    required this.name,
    required this.plants,
  });

  factory GreenhouseEntity.fromCache(GreenhouseCacheModel model) =>
      GreenhouseEntity(
        remoteId: model.remoteId,
        name: model.name,
        plants: model.plants.map(PlantEntity.fromCache).toList(),
      );

  GreenhouseCacheModel toCache() => GreenhouseCacheModel(
        remoteId: remoteId,
        name: name,
        plants: plants.map((e) => e.toCache()).toList(),
      );

  BluetoothDeviceModel toBluetoothModel() => BluetoothDeviceModel(
        remoteId: remoteId,
        advName: name,
      );

  @override
  List<Object?> get props => [remoteId, name];
}
