part of '../core.dart';

class AppRunnerWidget extends StatelessWidget {
  final WidgetBuilder app;
  final WidgetBuilder splash;
  final WidgetBuilder error;

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
            return splash(context);
          case AppInitStatus.initialized:
            return app(context);
          case AppInitStatus.error:
            return error(context);
        }
      },
    );
  }
}
