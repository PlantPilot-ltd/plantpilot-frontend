part of '/ui_core.dart';

class AppThemeData {
  final String themeCode;
  final ThemeData materialAppTheme;
  final SystemUiOverlayStyle systemUiOverlayStyle;
  final AppColorScheme colorScheme;

  AppThemeData.light({
    this.colorScheme = const AppColorScheme.light(),
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
  })  : themeCode = "LIGHT",
        materialAppTheme = AppMaterialAppThemes.light;

  AppThemeData.dark({
    this.colorScheme = const AppColorScheme.light(),
    this.systemUiOverlayStyle = SystemUiOverlayStyle.light,
  })  : themeCode = "DARK",
        materialAppTheme = AppMaterialAppThemes.dark;

  factory AppThemeData.fromCode(String? code, {AppThemeData? defaultData}) {
    switch (code) {
      case "LIGHT":
        return AppThemeData.light();
      case "DARK":
        return AppThemeData.dark();
      default:
        return defaultData ?? AppThemeData.light();
    }
  }
}
