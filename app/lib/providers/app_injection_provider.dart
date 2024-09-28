import 'package:app/repositories/index.dart';
import 'package:app/router/index.dart';
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
  // Repositories
  static BluetoothRepository get bluetoothRepository =>
      GetIt.instance.get<BluetoothRepository>();

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

    /// Repositories injection
    ///
    GetIt.I.registerSingleton<BluetoothRepository>(
      BluetoothRepository(
        logger: logger,
        // TODO: take from configuration
        config: const BluetoothConfiguration.test(),
      ),
    );
  }
}
