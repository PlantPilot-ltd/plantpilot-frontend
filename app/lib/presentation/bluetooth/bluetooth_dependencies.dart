import 'package:app/repositories/index.dart';
import 'package:app/router/index.dart';

class BluetoothDependencies {
  final BluetoothRepository bluetoothRepository;
  final AppRouter router;

  const BluetoothDependencies({
    required this.bluetoothRepository,
    required this.router,
  });
}
