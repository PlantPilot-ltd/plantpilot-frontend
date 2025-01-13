import 'package:app/services/index.dart';
import 'package:core/core.dart';

abstract class GreenhousesCacheServiceBase extends CacheService {
  GreenhousesCacheServiceBase({required super.configuration});

  ThrowableResponse<List<GreenhouseCacheModel>> getGreenhouses();

  VoidThrowableResponse addGreenhouse(GreenhouseCacheModel model);

  VoidThrowableResponse removeGreenhouse(GreenhouseCacheModel model);
}
