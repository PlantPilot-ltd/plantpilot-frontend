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
      title: 'Flutter Demo',
      localizationsDelegates: <LocalizationsDelegate>{
        ...AppLocalization.localizationsDelegates,
        ...CoreUILocalization.localizationsDelegates,
      },
      supportedLocales: <Locale>{
        ...AppLocalization.supportedLocales,
        ...CoreUILocalization.supportedLocales,
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppInjectionProvider.router.router,
    );
  }
}
