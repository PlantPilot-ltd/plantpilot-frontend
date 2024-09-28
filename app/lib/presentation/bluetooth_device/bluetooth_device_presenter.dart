import 'dart:math';
import 'dart:typed_data';

import 'package:app/repositories/index.dart';
import 'package:ui_core/ui_core.dart';

import 'bluetooth_device_dependencies.dart';

class BluetoothDevicePresenter extends VPDPresenter<BluetoothRepository> {
  final BluetoothDeviceDependencies dependencies;
  BluetoothDevicePresenter(this.dependencies)
      : super(dataStore: dependencies.bluetoothRepository);

  void onConnectTap() {
    dataStore.connectToDevice(dependencies.device);
  }

  void onDisconnectTap() {
    dataStore.disconnectDevice();
  }

  void onSendDataTap() {
    dataStore.sendDataToDevice(
      model: _generateRandomData(),
      encoder: (_) => _,
    );
  }

  List<int> _generateRandomData() {
    final rnd = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    final str = Iterable.generate(
      8,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ).toList();

    return Uint8List.fromList(str).toList();
  }
}
