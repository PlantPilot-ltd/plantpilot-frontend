import 'package:app/presentation/index.dart';
import 'package:app/providers/index.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Plantpilot',
      theme: CoreUIThemes.light,
      routerConfig: AppInjectionProvider.router.router,
      localizationsDelegates: <LocalizationsDelegate>{
        ...AppLocalization.localizationsDelegates,
        ...CoreUILocalization.localizationsDelegates,
      },
      supportedLocales: <Locale>{
        ...AppLocalization.supportedLocales,
        ...CoreUILocalization.supportedLocales,
      },
    );
  }
}
