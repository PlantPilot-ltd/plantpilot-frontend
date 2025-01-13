import 'package:equatable/equatable.dart';

class BluetoothDataModel extends Equatable {
  final List<int> data;
  final DateTime timeStamp;

  const BluetoothDataModel({required this.data, required this.timeStamp});

  @override
  List<Object?> get props => [data, timeStamp];
}
