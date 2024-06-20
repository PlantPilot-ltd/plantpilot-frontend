part of '/ui_core.dart';

class AppRunnerWidget extends StatelessWidget {
  final Widget app;
  final Widget splash;
  final Widget error;

  final AppRunnerServiceBase appRunnerService;

  const AppRunnerWidget({
    super.key,
    required this.app,
    required this.splash,
    required this.error,
    required this.appRunnerService,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (appRunnerService.status.value) {
          case AppInitStatus.idle:
            return splash;
          case AppInitStatus.initialized:
            return app;
          case AppInitStatus.error:
            return error;
        }
      },
    );
  }
}
