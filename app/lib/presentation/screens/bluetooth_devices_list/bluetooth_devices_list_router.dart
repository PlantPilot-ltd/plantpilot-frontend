import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:go_router/go_router.dart';

final class BluetoothDevicesListRouter {
  static const String routePath = '/bluetooth_devices';
  static const String routeName = 'bluetooth_devices_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: BluetoothDevicesListScreen(
            dependencies: BluetoothDevicesListDependencies(
              router: AppInjectionProvider.router,
              blRepo: AppInjectionProvider.bluetoothRepository,
              ghRepo: AppInjectionProvider.greenhousesListRepository,
            ),
          ),
        ),
        routes: [
          GreenhouseAddRouter.route,
        ],
      );
}

extension BluetoothDevicesListRouterX on GoRouter {
  void goBluetoothDevicesList() =>
      goNamed(BluetoothDevicesListRouter.routeName);
}
