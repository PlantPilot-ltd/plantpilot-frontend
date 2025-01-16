import 'package:core/core.dart';
import 'package:http_interceptor/http_interceptor.dart';

class DevLoggingInterceptor extends InterceptorContract {
  final LogService logger;

  DevLoggingInterceptor({required this.logger});

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    logger.logInfo(
      'Server Request',
      request.toString(),
    );
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    logger.logInfo(
      'Server Response',
      response.toString(),
    );
    return response;
  }
}
