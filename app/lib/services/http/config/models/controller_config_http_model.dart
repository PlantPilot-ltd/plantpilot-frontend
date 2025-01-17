import 'package:equatable/equatable.dart';

class ControllerConfigHttpModel extends Equatable {
  final String deviceVersion;
  final int inputsCount;
  final int plantsCount;
  final int plantInputCount;

  const ControllerConfigHttpModel({
    required this.deviceVersion,
    required this.inputsCount,
    required this.plantsCount,
    required this.plantInputCount,
  });

  factory ControllerConfigHttpModel.fromJson(Map<String, dynamic> json) {
    return ControllerConfigHttpModel(
      deviceVersion: json['deviceVersion'],
      inputsCount: json['inputsCount'] as int,
      plantsCount: json['plantsCount'] as int,
      plantInputCount: json['plantInputCount'] as int,
    );
  }

  @override
  List<Object?> get props => [
        deviceVersion,
        inputsCount,
        plantsCount,
        plantInputCount,
      ];
}
