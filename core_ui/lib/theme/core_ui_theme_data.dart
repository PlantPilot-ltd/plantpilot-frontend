part of '/core_ui.dart';

final class CoreUIThemeData {
  final String themeCode;
  final ThemeData materialAppTheme;
  final SystemUiOverlayStyle systemUiOverlayStyle;
  final CoreUIColorScheme colorScheme;

  CoreUIThemeData.light({
    this.colorScheme = const CoreUIColorScheme.light(),
    this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
  })  : themeCode = "LIGHT",
        materialAppTheme = CoreUIThemes.light;

  CoreUIThemeData.dark({
    this.colorScheme = const CoreUIColorScheme.light(),
    this.systemUiOverlayStyle = SystemUiOverlayStyle.light,
  })  : themeCode = "DARK",
        materialAppTheme = CoreUIThemes.dark;

  factory CoreUIThemeData.fromCode(String? code,
      {CoreUIThemeData? defaultData}) {
    switch (code) {
      case "LIGHT":
        return CoreUIThemeData.light();
      case "DARK":
        return CoreUIThemeData.dark();
      default:
        return defaultData ?? CoreUIThemeData.light();
    }
  }
}
