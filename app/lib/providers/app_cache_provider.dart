import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:path_provider/path_provider.dart';

final class AppCacheProvider {
  final TentControllersCacheServiceBase controllers;

  const AppCacheProvider({
    required this.controllers,
  });

  static Future<AppCacheProvider> fromEnvironment(
    EnvironmentType? envType,
  ) async {
    switch (envType) {
      case EnvironmentType.production:
        return AppCacheProvider.prod();
      case EnvironmentType.development:
        return AppCacheProvider.dev();
      case EnvironmentType.mock:
        return AppCacheProvider.mock();
      default:
        return AppCacheProvider.dev();
    }
  }

  AppCacheProvider._fromConfig({
    required CacheServiceConfiguration configuration,
  }) : controllers = TentControllersCacheService(configuration: configuration);

  AppCacheProvider.mock()
      : controllers = TentControllersCacheServiceMock(
          configuration: CacheServiceConfiguration(
            directory: "",
            environmentType: EnvironmentType.mock,
          ),
        );

  static Future<AppCacheProvider> dev() async {
    final directory = await getApplicationDocumentsDirectory();
    return AppCacheProvider._fromConfig(
      configuration: CacheServiceConfiguration(
        environmentType: EnvironmentType.production,
        directory: directory.path,
      ),
    );
  }

  static Future<AppCacheProvider> prod() async {
    final directory = await getApplicationDocumentsDirectory();
    return AppCacheProvider._fromConfig(
      configuration: CacheServiceConfiguration(
        environmentType: EnvironmentType.production,
        directory: directory.path,
      ),
    );
  }

  void cleanCache() {
    controllers.cleanCache();
  }

  void close() {
    controllers.close();
  }
}
