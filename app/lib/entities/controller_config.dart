import 'package:app/services/index.dart';
import 'package:equatable/equatable.dart';

class ControllerConfigEntity extends Equatable {
  final String deviceVersion;
  final int inputsCount;
  final int plantsCount;
  final int plantInputCount;

  const ControllerConfigEntity({
    required this.deviceVersion,
    required this.inputsCount,
    required this.plantsCount,
    required this.plantInputCount,
  });

  factory ControllerConfigEntity.fromHttpModel(
    ControllerConfigHttpModel model,
  ) {
    return ControllerConfigEntity(
      deviceVersion: model.deviceVersion,
      inputsCount: model.inputsCount,
      plantsCount: model.plantsCount,
      plantInputCount: model.plantInputCount,
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
