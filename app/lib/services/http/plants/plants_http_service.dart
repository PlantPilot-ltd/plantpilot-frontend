import 'package:app/services/index.dart';
import 'package:core/core.dart';

class PlantsHttpService extends PlantsHttpServiceBase {
  const PlantsHttpService(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<List<PlantHttpModel>>> plants() =>
      makeRequest<List<PlantHttpModel>>(
        (json) => (json as List<Map<String, dynamic>>)
            .map(PlantHttpModel.fromJson)
            .toList(),
        'plants/all',
        requestType: RequestType.get,
      );
}
