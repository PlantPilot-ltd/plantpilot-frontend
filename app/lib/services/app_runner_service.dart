import 'dart:async';
import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class AppRunnerService extends AppRunnerServiceBase {
  @override
  Future<Object?> afterRun() async {
    try {
      await Future.wait([
        // Delay to show splash
        // Future.delayed(SplashScreen.animationDuration * 2),
        AppInjectionProvider.tentContollersRepository.fetchData(),
      ]);
      return null;
    } catch (e, stackTrace) {
      return AppException.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> beforeRun() async {
    await AppInjectionProvider.setupInjection();
  }

  // @override
  // Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
  //   if (state == AppLifecycleState.detached) {
  //     AppInjectionProvider.cacheProvider.close();
  //   }
  // }

  @override
  Widget buildAppWidget(BuildContext context) => const MyApp();

  @override
  Widget buildErrorWidget(BuildContext context) => InitErrorScreen();

  @override
  Widget buildSplashWidget(BuildContext context) => SplashScreen();
}
