part of '/core_ui.dart';

/// Built-in material themes
final class CoreUIThemes {
  static ThemeData get light => ThemeData(
        fontFamily: CoreUIFonts.sfUIText,
        brightness: Brightness.light,
        primaryColor: CoreUIColors.primary,
        cardColor: CoreUIColors.primary,
        scaffoldBackgroundColor: CoreUIColors.white2,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: CoreUIColors.white2,
          foregroundColor: CoreUIColors.black1,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Color.fromRGBO(0, 0, 0, 0.4),
          backgroundColor: CoreUIColors.white2,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: CoreUIColors.primary,
          brightness: Brightness.light,
          surface: CoreUIColors.white2,
          error: CoreUIColors.warn,
        ),
      );

  static ThemeData get dark => ThemeData(
        fontFamily: CoreUIFonts.sfUIText,
        brightness: Brightness.dark,
        primaryColor: CoreUIColors.primary,
        cardColor: CoreUIColors.primary,
        scaffoldBackgroundColor: Colors.black54,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: CoreUIColors.black2,
          foregroundColor: CoreUIColors.white1,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Color.fromRGBO(0, 0, 0, 0.4),
          backgroundColor: CoreUIColors.black2,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: CoreUIColors.primary,
          brightness: Brightness.dark,
          surface: CoreUIColors.black2,
          error: CoreUIColors.warn,
        ),
      );
}
