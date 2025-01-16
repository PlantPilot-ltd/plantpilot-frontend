import 'package:app/services/index.dart';
import 'package:core/core.dart';

abstract class PlantsHttpServiceBase extends HttpService {
  const PlantsHttpServiceBase(super.httpClient, super.configuration);

  Future<ThrowableResponse<List<PlantHttpModel>>> plants();
}
