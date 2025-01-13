import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class BluetoothConnectionEntity extends Equatable {
  final BluetoothDeviceEntity device;
  final BluetoothConnectionStateEntity state;

  const BluetoothConnectionEntity({
    required this.device,
    required this.state,
  });

  factory BluetoothConnectionEntity.fromModel(BluetoothConnectionModel model) {
    return BluetoothConnectionEntity(
      device: BluetoothDeviceEntity.fromModel(model.device),
      state: BluetoothConnectionStateEntity.fromModel(model.state),
    );
  }

  @override
  List<Object?> get props => [device, state];
}
