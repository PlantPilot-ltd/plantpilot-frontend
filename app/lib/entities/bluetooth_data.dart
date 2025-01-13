import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class BluetoothDataEntity extends Equatable {
  final List<int> data;
  final DateTime timeStamp;

  const BluetoothDataEntity({required this.data, required this.timeStamp});

  factory BluetoothDataEntity.fromModel(BluetoothDataModel model) {
    return BluetoothDataEntity(
      data: model.data,
      timeStamp: model.timeStamp,
    );
  }

  @override
  List<Object?> get props => [data, timeStamp];
}
