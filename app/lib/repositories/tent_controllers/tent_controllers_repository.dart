import 'package:app/services/index.dart';
import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

part 'tent_controllers_repository.g.dart';

class TentContollersRepository = _TentContollersRepository
    with _$TentContollersRepository;

abstract class _TentContollersRepository extends VPDDataStore with Store {
  final LogService _logger;
  final TentControllersCacheServiceBase _cacheService;

  @observable
  bool isLoading = true;

  @observable
  List<TentController> controllers = [];

  _TentContollersRepository({
    required LogService logger,
    required TentControllersCacheServiceBase cacheService,
  })  : _logger = logger,
        _cacheService = cacheService;

  @override
  void dispose() {}

  @action
  Future<void> fetchData() async {
    isLoading = true;
    await _fetchLocalData();
    // await _fetchRemoteData();
    isLoading = false;
  }

  @action
  Future<void> _fetchLocalData() async {
    final result = _cacheService.getControllers();
    if (result.failure != null) {
      _logger.logException(result.failure!);
      return;
    }
    transaction(() {
      controllers.clear();
      controllers.addAll(result.result!.map(TentController.fromCache));
    });
  }
}
