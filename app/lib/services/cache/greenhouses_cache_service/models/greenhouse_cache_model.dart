import 'package:app/services/index.dart';

class GreenhouseCacheModel implements CacheableObject {
  @override
  String get key => remoteId;

  final String remoteId;
  final String name;
  final List<PlantCacheModel> plants;

  const GreenhouseCacheModel({
    required this.remoteId,
    required this.name,
    required this.plants,
  });

  factory GreenhouseCacheModel.fromJson(dynamic json) {
    return GreenhouseCacheModel(
      remoteId: (json as Map<String, dynamic>)['remoteId'] as String,
      name: json['name'] as String,
      plants: (json['plants'] as List<dynamic>)
          .map(PlantCacheModel.fromJson)
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': remoteId,
        'name': name,
        'plants': plants.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [remoteId, name, plants];

  @override
  bool? get stringify => true;
}
