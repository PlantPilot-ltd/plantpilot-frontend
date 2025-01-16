import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class PlantHttpModel extends Equatable {
  final String id;
  final String name;
  final String image;
  final PlantTypeHttpModel type;

  const PlantHttpModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, image, type];

  factory PlantHttpModel.fromJson(Map<String, dynamic> json) {
    return PlantHttpModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      type: PlantTypeHttpModel.fromString(json['type']),
    );
  }
}
