import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:http/testing.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AppHttpProvider {
  final PlantsHttpServiceBase plants;

  AppHttpProvider({
    required this.plants,
  });

  AppHttpProvider.fromConfig({
    required Client httpClient,
    required HttpServiceConfiguration configuration,
  }) : this(
          plants: PlantsHttpService(httpClient, configuration),
        );

  AppHttpProvider.mockFromConfig({
    required MockClient httpClient,
    required HttpServiceConfiguration configuration,
  }) : this(
          plants: PlantsHttpServiceMock(httpClient, configuration),
        );

  factory AppHttpProvider.fromEnvironment(
    EnvironmentType? envType, {
    required LogService logger,
  }) {
    switch (envType) {
      case EnvironmentType.production:
        return AppHttpProvider.production();
      case EnvironmentType.development:
        return AppHttpProvider.develop(logger: logger);
      case EnvironmentType.mock:
        return AppHttpProvider.mock(UnitTestMockClient());
      default:
        return AppHttpProvider.develop(logger: logger);
    }
  }

  AppHttpProvider.production()
      : this.fromConfig(
          httpClient: Client(),
          configuration: HttpServiceConfiguration(
            urlProtocol: URLProtocol.https,
            serverUrl: 'plantpilot.com',
            serverApiUrl: '/api/',
            refreshTokenAttempts: 1,
            environmentType: EnvironmentType.production,
            // TODO: Implement authorization
            getAuthorizationToken: () => null,
            // getAuthorizationToken: () =>
            //     AppInjectionProvider.userDataRepository.userData.authToken,
            refreshAuthorizationToken: (response) => false,
            onUnauthorizedException: (response, exception) => null,
          ),
        );

  AppHttpProvider.develop({
    required LogService logger,
  }) : this.fromConfig(
          httpClient: InterceptedClient.build(
            interceptors: [
              DevLoggingInterceptor(logger: logger),
            ],
          ),
          configuration: HttpServiceConfiguration(
            urlProtocol: URLProtocol.https,
            serverUrl: 'plantpilot.test.com',
            serverApiUrl: '/api/',
            refreshTokenAttempts: 1,
            environmentType: EnvironmentType.development,
            // TODO: Implement authorization
            getAuthorizationToken: () => null,
            // getAuthorizationToken: () =>
            //     AppInjectionProvider.userDataRepository.userData.authToken,
            refreshAuthorizationToken: (response) => false,
            onUnauthorizedException: (response, exception) => null,
          ),
        );

  AppHttpProvider.mock(MockClient httpClientMock)
      : this.mockFromConfig(
          httpClient: httpClientMock,
          configuration: HttpServiceConfiguration(
            urlProtocol: URLProtocol.https,
            serverUrl: '',
            serverApiUrl: '',
            refreshTokenAttempts: 1,
            environmentType: EnvironmentType.mock,
            getAuthorizationToken: () => '',
            refreshAuthorizationToken: (response) => false,
            onUnauthorizedException: (response, exception) => null,
          ),
        );
}
