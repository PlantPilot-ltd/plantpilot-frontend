import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:path_provider/path_provider.dart';

final class AppCacheProvider {
  final GreenhousesCacheServiceBase greenhouses;

  const AppCacheProvider({
    required this.greenhouses,
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
  }) : greenhouses = GreenhousesCacheService(configuration: configuration);

  AppCacheProvider.mock()
      : greenhouses = GreenhousesCacheServiceMock(
          configuration: const CacheServiceConfiguration(
            directory: '',
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
    greenhouses.cleanCache();
  }

  void close() {
    greenhouses.close();
  }
}
