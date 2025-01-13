import 'package:app/presentation/index.dart';
import 'package:core_ui/core_ui.dart';

import 'greenhouse_add_store.dart';

class GreenhouseAddPresenter extends VPDPresenter<GreenhouseAddStore> {
  final AppRouter appRouter;
  GreenhouseAddPresenter(GreenhouseAddDependencies dependencies)
      : appRouter = dependencies.appRouter,
        super(dataStore: GreenhouseAddStore(dependencies));

  void onBackTap() {
    // dataStore.greenhouseRepository.disconnect();
    appRouter.router.pop();
  }

  void onConnectTap() {
    dataStore.greenhouseRepository.connect();
  }

  void onDisconnectTap() {
    dataStore.greenhouseRepository.disconnect();
  }

  void onTurnLEDOnTap() {
    dataStore.greenhouseRepository.turnOnLED();
  }

  void onTurnLEDOffTap() {
    dataStore.greenhouseRepository.turnOffLED();
  }
}
