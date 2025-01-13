import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

class BluetoothDeviceModel extends Equatable {
  final String remoteId;
  final String advName;

  const BluetoothDeviceModel({
    required this.remoteId,
    required this.advName,
  });

  factory BluetoothDeviceModel.fromBlModel(bl.BluetoothDevice model) {
    return BluetoothDeviceModel(
      remoteId: model.remoteId.str,
      advName: model.advName,
    );
  }

  bl.BluetoothDevice toBlModel() {
    return bl.BluetoothDevice.fromId(remoteId);
  }

  @override
  List<Object?> get props => [remoteId, advName];
}
