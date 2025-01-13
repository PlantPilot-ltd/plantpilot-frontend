import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:app/repositories/index.dart';
import 'package:app/services/bluetooth/index.dart';
import 'package:go_router/go_router.dart';

final class GreenhouseAddRouter {
  static const String routePath = 'add/:id';
  static const String routeName = 'greenhouse_add';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        redirect: (context, state) {
          final device = state.getObjectById(
            state,
            AppInjectionProvider.bluetoothRepository.getScannedDeviceById,
          );
          return device == null
              ? state.namedLocation(BluetoothDevicesListRouter.routeName)
              : null;
        },
        pageBuilder: (context, state) => NoTransitionPage(
          child: GreenhouseAddScreen(
            dependencies: GreenhouseAddDependencies(
              appRouter: AppInjectionProvider.router,
              greenhouseRepository: GreenhouseRepository(
                logger: AppInjectionProvider.logger,
                config: BluetoothConfigurationModel.fromEnvironment(
                  AppConstantsProvider.environmentType,
                ),
                device: state.getObjectById(
                  state,
                  AppInjectionProvider.bluetoothRepository.getScannedDeviceById,
                )!,
              ),
            ),
          ),
        ),
      );
}

extension GreenhouseAddRouterX on GoRouter {
  void goGreenhouseAdd(BluetoothDeviceEntity device) => goNamed(
        GreenhouseAddRouter.routeName,
        pathParameters: {'id': device.remoteId},
      );
}
