import 'package:app/services/index.dart';
import 'package:core/core.dart';

abstract class ConfigHttpServiceBase extends HttpService {
  const ConfigHttpServiceBase(super.httpClient, super.configuration);

  Future<ThrowableResponse<ControllerConfigHttpModel>> controllerConfig(
    String deviceVersion,
  );
}
