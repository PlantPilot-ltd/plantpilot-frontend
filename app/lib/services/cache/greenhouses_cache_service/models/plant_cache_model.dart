import 'package:app/services/cache/models/cacheable_object.dart';

enum PlantTypeCacheModel {
  small,
  medium,
  large;

  factory PlantTypeCacheModel.fromString(String data) {
    switch (data) {
      case 'small':
        return PlantTypeCacheModel.small;
      case 'medium':
        return PlantTypeCacheModel.medium;
      case 'large':
        return PlantTypeCacheModel.large;
      default:
        return PlantTypeCacheModel.small;
    }
  }
}

class PlantCacheModel implements CacheableObject {
  @override
  String get key => id;

  final String id;
  final String name;
  final String image;
  final PlantTypeCacheModel type;

  const PlantCacheModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory PlantCacheModel.fromJson(dynamic json) {
    return PlantCacheModel(
      id: (json as Map<String, dynamic>)['id'],
      name: json['name'],
      image: json['image'],
      type: PlantTypeCacheModel.fromString(json['type']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'type': type,
      };

  @override
  List<Object?> get props => [id, name, image, type];

  @override
  bool? get stringify => true;
}
