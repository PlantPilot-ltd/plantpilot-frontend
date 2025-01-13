import 'package:app/repositories/index.dart';
import 'package:core_ui/core_ui.dart';

import 'greenhouse_add_dependencies.dart';

part 'greenhouse_add_store.g.dart';

class GreenhouseAddStore = _GreenhouseAddStore with _$GreenhouseAddStore;

abstract class _GreenhouseAddStore extends VPDDataStore with Store {
  final GreenhouseRepository greenhouseRepository;

  _GreenhouseAddStore(GreenhouseAddDependencies dependencies)
      : greenhouseRepository = dependencies.greenhouseRepository;
}
