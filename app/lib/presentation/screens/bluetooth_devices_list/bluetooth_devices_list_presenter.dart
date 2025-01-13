import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_devices_list_store.dart';

class BluetoothDevicesListPresenter
    extends VPDPresenter<BluetoothDevicesListStore> {
  final AppRouter _router;
  BluetoothDevicesListPresenter(BluetoothDevicesListDependencies dependencies)
      : _router = dependencies.router,
        super(dataStore: BluetoothDevicesListStore(dependencies));

  @override
  void initState() {
    super.initState();
    dataStore.blRepo.startScanningForDevices();
  }

  @override
  void dispose() {
    super.dispose();
    dataStore.blRepo.stopScanningForDevices();
  }

  void onBackTap() {
    _router.router.goRoot();
  }

  void onResultTap(BluetoothScanResultEntity result) {
    _router.router.goGreenhouseAdd(result.device);
  }

  void onToSettingsTap() {
    dataStore.blRepo.tryTurnOnBluetooth();
  }

  void onStartScanTap() {
    dataStore.blRepo.startScanningForDevices();
  }
}
