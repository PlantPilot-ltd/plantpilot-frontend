import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'bluetooth_controllers_list_dependencies.dart';

part 'bluetooth_controllers_list_store.g.dart';

class BluetoothControllersListStore = _BluetoothControllersListStore
    with _$BluetoothControllersListStore;

abstract class _BluetoothControllersListStore extends VPDDataStore with Store {
  final BluetoothRepository bluetoothRepository;
  final TentContollersRepository tentContollersRepository;

  _BluetoothControllersListStore(
    BluetoothControllersListDependencies dependencies,
  )   : bluetoothRepository = dependencies.bluetoothRepository,
        tentContollersRepository = dependencies.tentContollersRepository;
}
