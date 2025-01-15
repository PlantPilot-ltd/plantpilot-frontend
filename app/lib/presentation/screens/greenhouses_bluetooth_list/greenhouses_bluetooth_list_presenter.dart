import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/presentation/screens/greenhouses_bluetooth_list/greenhouses_bluetooth_list_store.dart';
import 'package:core_ui/core_ui.dart';

class GreenhousesBluetoothListPresenter
    extends VPDPresenter<GreenhousesBluetoothListStore> {
  final AppRouter _router;
  GreenhousesBluetoothListPresenter(
    GreenhousesBluetoothListDependencies dependencies,
  )   : _router = dependencies.router,
        super(dataStore: GreenhousesBluetoothListStore(dependencies));

  @override
  void dispose() {
    super.dispose();
    dataStore.dispose();
  }

  void onBackTap() {
    _router.router.goRoot();
  }

  void onResultTap(BluetoothScanResultEntity result) {
    _router.router.goGreenhouseAdd(result.device);
  }

  void onToSettingsTap() {
    dataStore.tryTurnOnBluetooth();
  }
}
