import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

enum AppRouteNames {
  exception('exception'),
  bluetooth('bluetooth'),
  bluetoothDevice('bluetooth_device');

  final String name;
  const AppRouteNames(this.name);
}

abstract class AppRouterConfig {
  static T? _getObjectById<T>(
    GoRouterState state,
    T? Function(String id) fetcher,
  ) {
    final id = state.pathParameters['id'];
    if (id == null) return null;
    return fetcher(id);
  }

  static List<RouteBase> get routes => [
        GoRoute(
          path: '/bluetooth',
          name: AppRouteNames.bluetooth.name,
          pageBuilder: (context, state) => CupertinoPage(
            child: BluetoothScreen(
              dependencies: BluetoothDependencies(
                bluetoothRepository: AppInjectionProvider.bluetoothRepository,
                router: AppInjectionProvider.router,
              ),
            ),
          ),
          routes: [
            GoRoute(
              path: 'devide/:id',
              name: AppRouteNames.bluetoothDevice.name,
              redirect: (context, state) {
                final device = _getObjectById(
                  state,
                  AppInjectionProvider.bluetoothRepository.getScannedDeviceById,
                );
                return device == null ? AppRouteNames.bluetooth.name : null;
              },
              pageBuilder: (context, state) => CupertinoPage(
                child: BluetoothDeviceScreen(
                  dependencies: BluetoothDeviceDependencies(
                    device: _getObjectById(
                      state,
                      AppInjectionProvider
                          .bluetoothRepository.getScannedDeviceById,
                    )!,
                    bluetoothRepository:
                        AppInjectionProvider.bluetoothRepository,
                  ),
                ),
              ),
            ),
          ],
        ),
      ];
}
