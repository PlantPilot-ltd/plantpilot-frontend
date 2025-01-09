import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_controllers_list_store.dart';

class BluetoothControllersListPresenter
    extends VPDPresenter<BluetoothControllersListStore> {
  final AppRouter _router;

  BluetoothControllersListPresenter(
    BluetoothControllersListDependencies dependencies,
  )   : _router = dependencies.router,
        super(dataStore: BluetoothControllersListStore(dependencies));

  @override
  void initState() {
    super.initState();
    dataStore.bluetoothRepository.startScanningForDevices();
  }

  @override
  void dispose() {
    super.dispose();
    dataStore.bluetoothRepository.stopScanningForDevices();
  }

  void onBackTap() {
    _router.router.goRoot();
  }

  void onResultTap(BluetoothScanResult result) {
    _router.router.goBluetoothDevice(result.device);
  }

  void onToSettingsTap() {
    dataStore.bluetoothRepository.tryTurnOnBluetooth();
  }

  void onStartScanTap() {
    dataStore.bluetoothRepository.startScanningForDevices();
  }
}
