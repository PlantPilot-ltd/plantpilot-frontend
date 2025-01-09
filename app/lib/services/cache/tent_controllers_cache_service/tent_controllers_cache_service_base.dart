import 'package:app/services/index.dart';
import 'package:core/core.dart';

abstract class TentControllersCacheServiceBase extends CacheService {
  TentControllersCacheServiceBase({required super.configuration});

  ThrowableResponse<List<TentControllerCacheModel>> getControllers();

  VoidThrowableResponse addController(TentControllerCacheModel model);

  VoidThrowableResponse removeController(TentControllerCacheModel model);
}
