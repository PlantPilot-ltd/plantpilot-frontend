import 'package:equatable/equatable.dart';

class GreenhouseStateEntity extends Equatable {
  final String data;

  const GreenhouseStateEntity({
    required this.data,
  });

  const GreenhouseStateEntity.empty() : data = '';

  @override
  List<Object?> get props => [data];
}
