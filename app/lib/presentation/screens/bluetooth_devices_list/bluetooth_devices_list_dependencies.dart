import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';

class BluetoothDevicesListDependencies {
  final AppRouter router;
  final BluetoothRepository blRepo;
  final GreenhousesListRepository ghRepo;

  const BluetoothDevicesListDependencies({
    required this.router,
    required this.blRepo,
    required this.ghRepo,
  });
}
