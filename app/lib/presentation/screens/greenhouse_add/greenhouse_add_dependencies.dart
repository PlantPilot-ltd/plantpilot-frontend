import 'package:app/presentation/index.dart';
import 'package:app/repositories/index.dart';

class GreenhouseAddDependencies {
  final AppRouter appRouter;
  final GreenhouseRepository greenhouseRepository;

  const GreenhouseAddDependencies({
    required this.appRouter,
    required this.greenhouseRepository,
  });
}
