import 'package:app/repositories/index.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class BluetoothConnection extends Equatable {
  final BluetoothDevice device;
  final BluetoothConnectionState state;

  const BluetoothConnection({
    required this.device,
    required this.state,
  });

  const BluetoothConnection.connecting(this.device)
      : state = BluetoothConnectionState.connecting;

  BluetoothConnection copyWith({
    Optional<BluetoothDevice>? device,
    Optional<BluetoothConnectionState>? state,
  }) {
    return BluetoothConnection(
      device: Optional.getValue(device, this.device),
      state: Optional.getValue(state, this.state),
    );
  }

  @override
  List<Object?> get props => [device, state];
}
