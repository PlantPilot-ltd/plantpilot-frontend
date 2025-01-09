import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:hive/hive.dart';

class TentControllersCacheService extends TentControllersCacheServiceBase {
  late final Box<TentControllerCacheModel> _controllersBox;

  TentControllersCacheService({required super.configuration}) {
    Hive.registerAdapter(
        'TentControllerCacheModel', TentControllerCacheModel.fromJson);
    _controllersBox = Hive.box<TentControllerCacheModel>(
      name: "tent_controllers_box",
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
  ThrowableResponse<List<TentControllerCacheModel>> getControllers() {
    final result = fetchItems(_controllersBox);
    return result;
  }

  @override
  VoidThrowableResponse addController(TentControllerCacheModel model) {
    final result = addOrUpdateItem(_controllersBox, model);
    if (result.failure == null) return VoidThrowableResponse.success();
    return VoidThrowableResponse.failure(result.failure!);
  }

  @override
  VoidThrowableResponse removeController(TentControllerCacheModel model) {
    final result = removeItem(_controllersBox, model);
    if (result.failure == null) return VoidThrowableResponse.success();
    return VoidThrowableResponse.failure(result.failure!);
  }
}
