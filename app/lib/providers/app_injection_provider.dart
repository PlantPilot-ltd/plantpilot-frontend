import 'package:app/providers/index.dart';
import 'package:app/repositories/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/services/index.dart';
import 'package:get_it/get_it.dart';

class AppInjectionProvider {
  // ///
  // Utils
  static LogService get logger => GetIt.instance.get<LogService>();

  // ///
  // Router
  static AppRouter get router => GetIt.instance.get<AppRouter>();

  // ///
  // Providers
  static AppCacheProvider get cacheProvider => GetIt.I.get<AppCacheProvider>();

  // ///
  // Repositories
  static BluetoothRepository get bluetoothRepository =>
      GetIt.instance.get<BluetoothRepository>();
  static GreenhousesListRepository get greenhousesListRepository =>
      GetIt.instance.get<GreenhousesListRepository>();

  // /////////////////////////////////////////
  // //// Methods ////////////////////////////
  // /////////////////////////////////////////

  /// Injects all services/stores/models of app
  static Future<void> setupInjection() async {
    /// Utils injection
    ///
    final logger = const LogService();
    GetIt.I.registerSingleton<LogService>(logger);

    /// Router injection
    ///
    GetIt.I.registerSingleton<AppRouter>(AppRouter.create());

    /// Environment type
    final envType = AppConstantsProvider.environmentType;

    /// Providers injection
    final cacheProvider = await AppCacheProvider.fromEnvironment(envType);
    GetIt.I.registerSingleton<AppCacheProvider>(cacheProvider);

    /// Repositories injection
    ///
    GetIt.I.registerSingleton<BluetoothRepository>(
      BluetoothRepository(
        logger: logger,
        config: BluetoothConfigurationModel.fromEnvironment(envType),
      ),
    );
    GetIt.I.registerSingleton<GreenhousesListRepository>(
      GreenhousesListRepository(
        logger: logger,
        cacheService: cacheProvider.greenhouses,
      ),
    );
  }
}
