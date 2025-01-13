import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_devices_list_dependencies.dart';

part 'bluetooth_devices_list_store.g.dart';

class BluetoothDevicesListStore = _BluetoothDevicesListStore
    with _$BluetoothDevicesListStore;

abstract class _BluetoothDevicesListStore extends VPDDataStore with Store {
  final BluetoothRepository blRepo;
  final GreenhousesListRepository ghRepo;

  _BluetoothDevicesListStore(BluetoothDevicesListDependencies dependencies)
      : blRepo = dependencies.blRepo,
        ghRepo = dependencies.ghRepo;
}
