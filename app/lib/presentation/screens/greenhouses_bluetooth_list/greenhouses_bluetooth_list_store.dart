import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

part 'greenhouses_bluetooth_list_store.g.dart';

class GreenhousesBluetoothListStore = _GreenhousesBluetoothListStore
    with _$GreenhousesBluetoothListStore;

abstract class _GreenhousesBluetoothListStore extends VPDDataStore with Store {
  final BluetoothRepository _blRepo;
  final GreenhousesListRepository _ghRepo;

  late ReactionDisposer _blStateReaction;

  BluetoothStateEntity? get bluetoothState => _blRepo.bluetoothState;
  BluetoothScanningStateEntity? get scanningState => _blRepo.scanningState;

  @computed
  List<BluetoothScanResultEntity> get lastScanResults {
    final addedIds = _ghRepo.greenhouses.map((e) => e.remoteId).toSet();
    return _blRepo.lastScanResults
        .where((e) => !addedIds.contains(e.device.remoteId))
        .toList();
  }

  _GreenhousesBluetoothListStore(
    GreenhousesBluetoothListDependencies dependencies,
  )   : _blRepo = dependencies.blRepo,
        _ghRepo = dependencies.ghRepo {
    _blRepo.startScanningForDevices();
    _blStateReaction = reaction(
      (_) => _blRepo.bluetoothState,
      (state) {
        if (state == BluetoothStateEntity.on) {
          _blRepo.startScanningForDevices();
        }
      },
      context: _blRepo.context,
    );
  }

  @override
  void dispose() {
    _blStateReaction.call();
    _blRepo.stopScanningForDevices();
  }

  void tryTurnOnBluetooth() {
    _blRepo.tryTurnOnBluetooth();
  }
}
