import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';

class BluetoothControllersListDependencies {
  final AppRouter router;
  final BluetoothRepository bluetoothRepository;
  final TentContollersRepository tentContollersRepository;

  const BluetoothControllersListDependencies({
    required this.router,
    required this.bluetoothRepository,
    required this.tentContollersRepository,
  });
}
