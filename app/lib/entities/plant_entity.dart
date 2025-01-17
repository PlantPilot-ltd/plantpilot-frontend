import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

enum PlantTypeEntity {
  small,
  medium,
  large;

  factory PlantTypeEntity.fromHttpModel(PlantTypeHttpModel model) {
    switch (model) {
      case PlantTypeHttpModel.small:
        return PlantTypeEntity.small;
      case PlantTypeHttpModel.medium:
        return PlantTypeEntity.medium;
      case PlantTypeHttpModel.large:
        return PlantTypeEntity.large;
    }
  }

  factory PlantTypeEntity.fromCacheModel(PlantTypeCacheModel model) {
    switch (model) {
      case PlantTypeCacheModel.small:
        return PlantTypeEntity.small;
      case PlantTypeCacheModel.medium:
        return PlantTypeEntity.medium;
      case PlantTypeCacheModel.large:
        return PlantTypeEntity.large;
    }
  }

  PlantTypeCacheModel toCache() => switch (this) {
        PlantTypeEntity.small => PlantTypeCacheModel.small,
        PlantTypeEntity.medium => PlantTypeCacheModel.medium,
        PlantTypeEntity.large => PlantTypeCacheModel.large,
      };
}

class PlantEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final PlantTypeEntity type;

  const PlantEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory PlantEntity.fromHttpModel(PlantHttpModel model) {
    return PlantEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      type: PlantTypeEntity.fromHttpModel(model.type),
    );
  }

  factory PlantEntity.fromCache(PlantCacheModel model) => PlantEntity(
        id: model.id,
        name: model.name,
        image: model.image,
        type: PlantTypeEntity.fromCacheModel(model.type),
      );

  @override
  List<Object?> get props => [id, name, image, type];

  PlantCacheModel toCache() => PlantCacheModel(
        id: id,
        name: name,
        image: image,
        type: type.toCache(),
      );
}
