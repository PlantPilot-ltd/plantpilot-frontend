import 'package:app/services/cache/models/cacheable_object.dart';

class GreenhouseCacheModel implements CacheableObject {
  @override
  String get key => remoteId;

  final String remoteId;
  final String name;

  const GreenhouseCacheModel({required this.remoteId, required this.name});

  factory GreenhouseCacheModel.fromJson(dynamic json) {
    return GreenhouseCacheModel(
      remoteId: (json as Map<String, dynamic>)['remoteId'] as String,
      name: json['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': remoteId,
        'name': name,
      };

  @override
  List<Object?> get props => [remoteId, name];

  @override
  bool? get stringify => true;
}
