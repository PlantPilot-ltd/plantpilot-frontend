import 'dart:async';
import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_core/ui_core.dart';

class AppRunnerService extends AppRunnerServiceBase {
  @override
  Future<Object?> afterRun() async {
    try {
      await Future.wait([
        // Delay to show splash
        // Future.delayed(SplashScreen.animationDuration * 2),
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
  Widget buildAppWidget() => const MyApp();

  @override
  Widget buildErrorWidget() => InitErrorScreen();

  @override
  Widget buildSplashWidget() => SplashScreen();
}
