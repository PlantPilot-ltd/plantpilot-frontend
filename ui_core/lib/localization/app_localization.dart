part of '/ui_core.dart';

class AppLocalization {
  static AppLocalizations of(BuildContext? context) => context == null
      ? AppLocalizationsEn()
      : AppLocalizations.of(context) ?? AppLocalizationsEn();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      AppLocalizations.localizationsDelegates;

  static const List<Locale> supportedLocales =
      AppLocalizations.supportedLocales;
}
