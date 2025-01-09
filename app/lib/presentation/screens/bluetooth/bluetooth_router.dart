import 'package:app/presentation/index.dart';
import 'package:app/providers/app_injection_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final class BluetoothRouter {
  static const String routePath = '/bluetooth';
  static const String routeName = 'bluetooth';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        pageBuilder: (context, state) => CupertinoPage(
          child: BluetoothScreen(
            dependencies: BluetoothDependencies(
              bluetoothRepository: AppInjectionProvider.bluetoothRepository,
              router: AppInjectionProvider.router,
            ),
          ),
        ),
        routes: [
          BluetoothDeviceRouter.route,
        ],
      );
}

extension BluetoothRouterX on GoRouter {
  void goBluetooth() => goNamed(BluetoothRouter.routeName);
}
