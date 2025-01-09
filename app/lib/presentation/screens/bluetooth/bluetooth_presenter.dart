import 'package:app/repositories/index.dart';
import 'package:app/presentation/index.dart';
import 'package:core_ui/core_ui.dart';

class BluetoothPresenter extends VPDPresenter<BluetoothRepository> {
  final BluetoothDependencies dependencies;
  BluetoothPresenter(this.dependencies)
      : super(dataStore: dependencies.bluetoothRepository);

  void onResultTap(BluetoothScanResult result) {
    dependencies.router.router.goBluetoothDevice(result.device);
  }
}
