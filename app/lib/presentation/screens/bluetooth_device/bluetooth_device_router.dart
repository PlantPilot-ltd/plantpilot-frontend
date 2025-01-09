import 'package:app/providers/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final class BluetoothDeviceRouter {
  static const String routePath = 'device/:id';
  static const String routeName = 'bluetooth-device';

  static GoRoute get route => GoRoute(
        path: routePath,
        name: routeName,
        redirect: (context, state) {
          final device = state.getObjectById(
            state,
            AppInjectionProvider.bluetoothRepository.getScannedDeviceById,
          );
          return device == null
              ? state.namedLocation(BluetoothRouter.routeName)
              : null;
        },
        pageBuilder: (context, state) => CupertinoPage(
          child: BluetoothDeviceScreen(
            dependencies: BluetoothDeviceDependencies(
              device: state.getObjectById(
                state,
                AppInjectionProvider.bluetoothRepository.getScannedDeviceById,
              )!,
              bluetoothRepository: AppInjectionProvider.bluetoothRepository,
            ),
          ),
        ),
      );
}

extension BluetoothDeviceRouterX on GoRouter {
  void goBluetoothDevice(BluetoothDevice device) => goNamed(
        BluetoothDeviceRouter.routeName,
        pathParameters: {'id': device.remoteId},
      );
}
