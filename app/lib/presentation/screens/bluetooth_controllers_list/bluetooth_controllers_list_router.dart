import 'package:app/providers/index.dart';
import 'package:go_router/go_router.dart';
import 'index.dart';

final class BluetoothControllersListRouter {
  static const String routePath = '/bluetooth';
  static const String routeName = 'bluetooth_controllers_list';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => NoTransitionPage(
          child: BluetoothControllersListScreen(
            dependencies: BluetoothControllersListDependencies(
              router: AppInjectionProvider.router,
              bluetoothRepository: AppInjectionProvider.bluetoothRepository,
              tentContollersRepository:
                  AppInjectionProvider.tentContollersRepository,
            ),
          ),
        ),
      );
}

extension BluetoothControllersListRouterX on GoRouter {
  void goBluetoothControllersList() =>
      goNamed(BluetoothControllersListRouter.routeName);
}
