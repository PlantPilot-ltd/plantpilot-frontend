import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class TentController extends Equatable {
  final String id;
  final String name;

  const TentController({required this.id, required this.name});

  factory TentController.fromCache(TentControllerCacheModel model) =>
      TentController(
        id: model.id,
        name: model.name,
      );

  TentControllerCacheModel toCache() => TentControllerCacheModel(
        id: id,
        name: name,
      );

  @override
  List<Object?> get props => [id, name];
}
