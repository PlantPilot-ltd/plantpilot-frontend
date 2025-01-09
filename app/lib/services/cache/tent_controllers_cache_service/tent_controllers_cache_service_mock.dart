import 'package:app/services/index.dart';
import 'package:core/core.dart';

class TentControllersCacheServiceMock extends TentControllersCacheServiceBase {
  final List<TentControllerCacheModel> _list = [];

  TentControllersCacheServiceMock({required super.configuration});

  @override
  void cleanCache() {
    _list.clear();
  }

  @override
  void close() {}

  @override
  ThrowableResponse<List<TentControllerCacheModel>> getControllers() {
    return ThrowableResponse.success(_list);
  }

  @override
  VoidThrowableResponse addController(TentControllerCacheModel model) {
    _list.add(model);
    return VoidThrowableResponse.success();
  }

  @override
  VoidThrowableResponse removeController(TentControllerCacheModel model) {
    _list.remove(model);
    return VoidThrowableResponse.success();
  }
}
