part of '/ui_core.dart';

/// Builtin material themes
class AppMaterialAppThemes {
  static ThemeData get light => ThemeData(
        fontFamily: "SFUIText",
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        cardColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white2,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.white2,
          foregroundColor: AppColors.black1,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Color.fromRGBO(0, 0, 0, 0.4),
          backgroundColor: AppColors.white2,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primary,
          brightness: Brightness.light,
          surface: AppColors.white2,
          error: AppColors.warn,
        ),
      );

  static ThemeData get dark => ThemeData(
        fontFamily: "SFUIText",
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        cardColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.black54,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.black2,
          foregroundColor: AppColors.white1,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Color.fromRGBO(0, 0, 0, 0.4),
          backgroundColor: AppColors.black2,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.primary,
          brightness: Brightness.dark,
          surface: AppColors.black2,
          error: AppColors.warn,
        ),
      );
}
