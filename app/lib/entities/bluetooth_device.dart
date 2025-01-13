import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class BluetoothDeviceEntity extends Equatable {
  final String remoteId;
  final String advName;

  const BluetoothDeviceEntity({
    required this.remoteId,
    required this.advName,
  });

  factory BluetoothDeviceEntity.fromModel(BluetoothDeviceModel model) {
    return BluetoothDeviceEntity(
      remoteId: model.remoteId,
      advName: model.advName,
    );
  }

  BluetoothDeviceModel toModel() {
    return BluetoothDeviceModel(
      remoteId: remoteId,
      advName: advName,
    );
  }

  @override
  List<Object?> get props => [remoteId, advName];
}
