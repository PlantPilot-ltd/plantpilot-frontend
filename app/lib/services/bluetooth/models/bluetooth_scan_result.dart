import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

class BluetoothScanResultModel extends Equatable {
  final BluetoothDeviceModel device;
  final BluetoothAdvertisementDataModel advertisementData;
  final int rssi;
  final DateTime timeStamp;

  const BluetoothScanResultModel({
    required this.device,
    required this.advertisementData,
    required this.rssi,
    required this.timeStamp,
  });

  factory BluetoothScanResultModel.fromBlModel(bl.ScanResult model) {
    return BluetoothScanResultModel(
      device: BluetoothDeviceModel.fromBlModel(model.device),
      advertisementData:
          BluetoothAdvertisementDataModel.fromBlModel(model.advertisementData),
      rssi: model.rssi,
      timeStamp: model.timeStamp,
    );
  }

  bl.ScanResult toBlModel() {
    return bl.ScanResult(
      device: device.toBlModel(),
      advertisementData: advertisementData.toBlModel(),
      rssi: rssi,
      timeStamp: timeStamp,
    );
  }

  @override
  List<Object?> get props => [device, advertisementData, rssi, timeStamp];
}
