part of '/core_ui.dart';

/// Built-in material themes
final class CoreUIThemes {
  static ThemeData get light => ThemeData(
        fontFamily: CoreUIFonts.sfUIText,
        brightness: Brightness.light,
        primaryColor: CoreUIColors.primary,
        cardColor: CoreUIColors.primary,
        scaffoldBackgroundColor: CoreUIColors.background,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: CoreUIColors.background,
          foregroundColor: CoreUIColors.text,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Color.fromRGBO(0, 0, 0, 0.4),
          backgroundColor: CoreUIColors.background,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: CoreUIColors.primary,
          brightness: Brightness.light,
          surface: CoreUIColors.background,
          error: CoreUIColors.warn,
        ),
      );
}
