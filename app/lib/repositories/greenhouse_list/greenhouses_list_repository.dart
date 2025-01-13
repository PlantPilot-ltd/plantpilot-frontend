import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:core_ui/core_ui.dart';

part 'greenhouses_list_repository.g.dart';

class GreenhousesListRepository = _GreenhousesListRepository
    with _$GreenhousesListRepository;

abstract class _GreenhousesListRepository extends VPDDataStore with Store {
  final LogService _logger;
  final GreenhousesCacheServiceBase _cacheService;

  @observable
  bool isLoading = true;

  @observable
  List<GreenhouseEntity> greenhouses = [];

  _GreenhousesListRepository({
    required LogService logger,
    required GreenhousesCacheServiceBase cacheService,
  })  : _logger = logger,
        _cacheService = cacheService;

  @override
  void dispose() {
    _cacheService.close();
  }

  @action
  Future<void> fetchData() async {
    isLoading = true;
    await _fetchLocalData();
    // await _fetchRemoteData();
    isLoading = false;
  }

  @action
  Future<void> _fetchLocalData() async {
    final result = _cacheService.getGreenhouses();
    if (result.failure != null) {
      _logger.logException(result.failure!);
      return;
    }
    transaction(() {
      greenhouses = result.result!.map(GreenhouseEntity.fromCache).toList();
    });
  }
}
