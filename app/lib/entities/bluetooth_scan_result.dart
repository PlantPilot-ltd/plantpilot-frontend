import 'package:app/entities/index.dart';
import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class BluetoothScanResultEntity extends Equatable {
  final BluetoothDeviceEntity device;
  final int rssi;
  final DateTime timeStamp;

  const BluetoothScanResultEntity({
    required this.device,
    required this.rssi,
    required this.timeStamp,
  });

  factory BluetoothScanResultEntity.fromModel(
    BluetoothScanResultModel model,
  ) {
    return BluetoothScanResultEntity(
      device: BluetoothDeviceEntity.fromModel(model.device),
      rssi: model.rssi,
      timeStamp: model.timeStamp,
    );
  }

  @override
  List<Object?> get props => [device, timeStamp];
}
