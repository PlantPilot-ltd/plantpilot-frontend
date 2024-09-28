import 'package:app/repositories/index.dart';

class BluetoothDeviceDependencies {
  final BluetoothDevice device;
  final BluetoothRepository bluetoothRepository;

  const BluetoothDeviceDependencies({
    required this.device,
    required this.bluetoothRepository,
  });
}
