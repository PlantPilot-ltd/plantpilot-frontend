import 'package:app/entities/index.dart';
import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';
import 'package:app/services/index.dart';
import 'package:core/core.dart';

class GreenhouseAddDependencies {
  final AppRouter appRouter;
  final LogService logger;
  final BluetoothRepository bluetoothRepository;
  final GreenhousesListRepository greenhousesRepository;
  final PlantsHttpServiceBase plantsHttpService;
  final ConfigHttpServiceBase configHttpService;
  final BluetoothDeviceEntity device;

  const GreenhouseAddDependencies({
    required this.appRouter,
    required this.logger,
    required this.bluetoothRepository,
    required this.greenhousesRepository,
    required this.plantsHttpService,
    required this.configHttpService,
    required this.device,
  });
}
