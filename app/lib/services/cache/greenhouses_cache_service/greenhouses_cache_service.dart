import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:hive/hive.dart';

class GreenhousesCacheService extends GreenhousesCacheServiceBase {
  late final Box<GreenhouseCacheModel> _controllersBox;

  GreenhousesCacheService({required super.configuration}) {
    Hive.registerAdapter(
      'TentControllerCacheModel',
      GreenhouseCacheModel.fromJson,
    );
    _controllersBox = Hive.box<GreenhouseCacheModel>(
      name: 'tent_controllers_box',
      directory: configuration.directory,
    );
  }

  @override
  void cleanCache() {
    _controllersBox.clear();
  }

  @override
  void close() {
    _controllersBox.close();
  }

  @override
  ThrowableResponse<List<GreenhouseCacheModel>> getGreenhouses() {
    final result = fetchItems(_controllersBox);
    return result;
  }

  @override
  VoidThrowableResponse addGreenhouse(GreenhouseCacheModel model) {
    final result = addOrUpdateItem(_controllersBox, model);
    if (result.failure == null) return const VoidThrowableResponse.success();
    return VoidThrowableResponse.failure(result.failure!);
  }

  @override
  VoidThrowableResponse removeGreenhouse(GreenhouseCacheModel model) {
    final result = removeItem(_controllersBox, model);
    if (result.failure == null) return const VoidThrowableResponse.success();
    return VoidThrowableResponse.failure(result.failure!);
  }
}
