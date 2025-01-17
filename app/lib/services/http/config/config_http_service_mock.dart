import 'package:app/services/index.dart';
import 'package:core/core.dart';

class ConfigHttpServiceMock extends ConfigHttpServiceBase {
  const ConfigHttpServiceMock(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<ControllerConfigHttpModel>> controllerConfig(
    String deviceVersion,
  ) async {
    return ThrowableResponse.success(
      const ControllerConfigHttpModel(
        deviceVersion: '0.1',
        inputsCount: 4,
        plantsCount: 3,
        plantInputCount: 2,
      ),
    );
  }
}
