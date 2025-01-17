import 'package:app/services/index.dart';
import 'package:core/core.dart';

class ConfigHttpService extends ConfigHttpServiceBase {
  const ConfigHttpService(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<ControllerConfigHttpModel>> controllerConfig(
    String deviceVersion,
  ) =>
      makeRequest<ControllerConfigHttpModel>(
        (json) => ControllerConfigHttpModel.fromJson(json),
        'config/deviceConfig/$deviceVersion',
        requestType: RequestType.get,
      );
}
