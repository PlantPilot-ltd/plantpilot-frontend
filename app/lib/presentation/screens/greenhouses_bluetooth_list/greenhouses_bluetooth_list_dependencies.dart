import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';

class GreenhousesBluetoothListDependencies {
  final AppRouter router;
  final BluetoothRepository blRepo;
  final GreenhousesListRepository ghRepo;

  const GreenhousesBluetoothListDependencies({
    required this.router,
    required this.blRepo,
    required this.ghRepo,
  });
}
