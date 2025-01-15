import 'package:app/services/index.dart';
import 'package:core/core.dart';

class GreenhousesCacheServiceMock extends GreenhousesCacheServiceBase {
  final List<GreenhouseCacheModel> _list = [];

  GreenhousesCacheServiceMock({required super.configuration});

  @override
  void cleanCache() {
    _list.clear();
  }

  @override
  void close() {}

  @override
  ThrowableResponse<List<GreenhouseCacheModel>> getGreenhouses() {
    return ThrowableResponse.success(_list);
  }

  @override
  VoidThrowableResponse addGreenhouse(GreenhouseCacheModel model) {
    _list.add(model);
    return const VoidThrowableResponse.success();
  }

  @override
  VoidThrowableResponse removeGreenhouse(GreenhouseCacheModel model) {
    _list.remove(model);
    return const VoidThrowableResponse.success();
  }
}
