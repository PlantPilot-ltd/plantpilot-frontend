part of '/ui_core.dart';

/// App color scheme model
final class AppColorScheme {
  final Color primary;

  final Color background;

  final Color accent;
  final Color warn;

  final Color text;
  final Color textLight;

  const AppColorScheme.light()
      : primary = AppColors.primary,
        background = AppColors.white2,
        accent = AppColors.accent,
        warn = AppColors.warn,
        text = AppColors.black1,
        textLight = AppColors.grey3;

  const AppColorScheme.dark()
      : primary = AppColors.primary,
        background = AppColors.black2,
        accent = AppColors.accent,
        warn = AppColors.warn,
        text = AppColors.white1,
        textLight = AppColors.grey3;
}
