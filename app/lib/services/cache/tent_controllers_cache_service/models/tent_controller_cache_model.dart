import 'package:app/services/cache/models/cacheable_object.dart';

class TentControllerCacheModel implements CacheableObject {
  @override
  String get key => id;

  final String id;
  final String name;

  const TentControllerCacheModel({required this.id, required this.name});

  factory TentControllerCacheModel.fromJson(dynamic json) {
    return TentControllerCacheModel(
      id: (json as Map<String, dynamic>)['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}
