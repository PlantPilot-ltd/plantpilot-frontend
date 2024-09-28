import 'package:app/repositories/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

class BluetoothScanResult extends Equatable {
  final BluetoothDevice device;
  final BluetoothAdvertisementData advertisementData;
  final int rssi;
  final DateTime timeStamp;

  const BluetoothScanResult({
    required this.device,
    required this.advertisementData,
    required this.rssi,
    required this.timeStamp,
  });

  factory BluetoothScanResult.fromBlModel(bl.ScanResult model) {
    return BluetoothScanResult(
      device: BluetoothDevice.fromBlModel(model.device),
      advertisementData:
          BluetoothAdvertisementData.fromBlModel(model.advertisementData),
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
