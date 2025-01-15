import 'package:app/presentation/index.dart';
import 'package:app/presentation/localization/app_localization_en.dart';
import 'package:flutter/material.dart';

extension AppLocalizationExtension on BuildContext {
  AppLocalization get localization =>
      AppLocalization.of(this) ?? AppLocalizationEn();
}
