import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as bl;

class BluetoothAdvertisementDataModel extends Equatable {
  final String advName;
  final int? txPowerLevel;

  /// not supported on iOS / macOS
  final int? appearance;
  final bool connectable;

  /// key: manufacturerId
  final Map<int, List<int>> manufacturerData;

  /// key: service guid
  final Map<String, List<int>> serviceData;
  final List<String> serviceUuids;

  const BluetoothAdvertisementDataModel({
    required this.advName,
    required this.txPowerLevel,
    required this.appearance,
    required this.connectable,
    required this.manufacturerData,
    required this.serviceData,
    required this.serviceUuids,
  });

  factory BluetoothAdvertisementDataModel.fromBlModel(
      bl.AdvertisementData model) {
    return BluetoothAdvertisementDataModel(
      advName: model.advName,
      txPowerLevel: model.txPowerLevel,
      appearance: model.appearance,
      connectable: model.connectable,
      manufacturerData: model.manufacturerData,
      serviceData: model.serviceData.map((k, v) => MapEntry(k.str, v)),
      serviceUuids: model.serviceUuids.map((v) => v.str).toList(),
    );
  }

  bl.AdvertisementData toBlModel() {
    return bl.AdvertisementData(
      advName: advName,
      txPowerLevel: txPowerLevel,
      appearance: appearance,
      connectable: connectable,
      manufacturerData: manufacturerData,
      serviceData: serviceData.map((k, v) => MapEntry(bl.Guid(k), v)),
      serviceUuids: serviceUuids.map((v) => bl.Guid(v)).toList(),
    );
  }

  @override
  List<Object?> get props => [
        advName,
        txPowerLevel,
        appearance,
        connectable,
        manufacturerData,
        serviceData,
        serviceUuids,
      ];
}
