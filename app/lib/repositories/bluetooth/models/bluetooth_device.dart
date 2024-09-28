import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

class BluetoothDevice extends Equatable {
  final String remoteId;
  final String advName;

  const BluetoothDevice({
    required this.remoteId,
    required this.advName,
  });

  factory BluetoothDevice.fromBlModel(bl.BluetoothDevice model) {
    return BluetoothDevice(
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
