import 'package:app/repositories/index.dart';
import 'package:app/router/index.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router;

  const AppRouter(this.router);

  factory AppRouter.create() {
    final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/${AppRouteNames.bluetooth.name}',
      // navigatorKey: NavigatorKeys.root,
      onException: (_, __, router) => router.go(AppRouteNames.exception.name),
      // redirect: (context, state) {
      //   for (final routeGuard in sortedRouteGuards) {
      //     final location = routeGuard.onNavigate(context, state);
      //     if (location != null) {
      //       return location;
      //     }
      //   }

      //   return null;
      // },
      // refreshListenable: Listenable.merge(
      //   sortedRouteGuards
      //       .map((routeGuard) => routeGuard.listenable)
      //       .whereType<Listenable>(),
      // ),
      routes: AppRouterConfig.routes,
      // observers: navigatorObservers.toList(),
    );
    return AppRouter(router);
  }

  void goBluetooth() => router.goNamed(AppRouteNames.bluetooth.name);

  void goBluetoothDevice(BluetoothDevice device) => router.goNamed(
        AppRouteNames.bluetoothDevice.name,
        pathParameters: {'id': device.remoteId},
      );
}
