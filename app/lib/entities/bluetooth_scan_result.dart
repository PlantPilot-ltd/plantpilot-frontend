import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class BluetoothScanResultEntity extends Equatable {
  final BluetoothDeviceEntity device;
  final int rssi;
  final DateTime timeStamp;
  final bool isConnected;

  const BluetoothScanResultEntity({
    required this.device,
    required this.rssi,
    required this.timeStamp,
    required this.isConnected,
  });

  factory BluetoothScanResultEntity.fromModel(
    BluetoothScanResultModel model,
  ) {
    return BluetoothScanResultEntity(
      device: BluetoothDeviceEntity.fromModel(model.device),
      rssi: model.rssi,
      timeStamp: model.timeStamp,
      isConnected: false,
    );
  }

  factory BluetoothScanResultEntity.fromConnectedDevice(
    BluetoothDeviceModel device,
  ) {
    return BluetoothScanResultEntity(
      device: BluetoothDeviceEntity.fromModel(device),
      rssi: 100,
      timeStamp: DateTime.now(),
      isConnected: true,
    );
  }

  @override
  List<Object?> get props => [device, timeStamp];
}
