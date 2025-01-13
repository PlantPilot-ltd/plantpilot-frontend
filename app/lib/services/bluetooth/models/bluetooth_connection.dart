import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class BluetoothConnectionModel extends Equatable {
  final BluetoothDeviceModel device;
  final BluetoothConnectionStateModel state;

  const BluetoothConnectionModel({
    required this.device,
    required this.state,
  });

  const BluetoothConnectionModel.connecting(this.device)
      : state = BluetoothConnectionStateModel.connecting;

  BluetoothConnectionModel copyWith({
    Optional<BluetoothDeviceModel>? device,
    Optional<BluetoothConnectionStateModel>? state,
  }) {
    return BluetoothConnectionModel(
      device: Optional.getValue(device, this.device),
      state: Optional.getValue(state, this.state),
    );
  }

  @override
  List<Object?> get props => [device, state];
}
