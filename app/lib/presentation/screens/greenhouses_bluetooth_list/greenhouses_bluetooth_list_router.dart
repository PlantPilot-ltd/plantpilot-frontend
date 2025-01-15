import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:go_router/go_router.dart';

final class GreenhousesBluetoothListRouter {
  static const String routePath = '/bluetooth_devices';
  static const String routeName = 'greenhouses_bluetooth_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: GreenhousesBluetoothListScreen(
            dependencies: GreenhousesBluetoothListDependencies(
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

extension GreenhousesBluetoothListRouterX on GoRouter {
  void goGreenhousesBluetoothList() =>
      goNamed(GreenhousesBluetoothListRouter.routeName);
}
