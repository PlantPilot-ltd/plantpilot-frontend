import 'package:app/repositories/index.dart';
import 'package:ui_core/ui_core.dart';

import 'bluetooth_dependencies.dart';

class BluetoothPresenter extends VPDPresenter<BluetoothRepository> {
  final BluetoothDependencies dependencies;
  BluetoothPresenter(this.dependencies)
      : super(dataStore: dependencies.bluetoothRepository);

  void onResultTap(BluetoothScanResult result) {
    dependencies.router.goBluetoothDevice(result.device);
  }
}
