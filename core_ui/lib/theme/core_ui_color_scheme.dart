part of '/core_ui.dart';

/// App color scheme model
final class CoreUIColorScheme {
  final Color primary;

  final Color background;

  final Color accent;
  final Color warn;

  final Color text;
  final Color textLight;

  const CoreUIColorScheme.light()
      : primary = CoreUIColors.primary,
        background = CoreUIColors.white2,
        accent = CoreUIColors.accent,
        warn = CoreUIColors.warn,
        text = CoreUIColors.black1,
        textLight = CoreUIColors.grey3;

  const CoreUIColorScheme.dark()
      : primary = CoreUIColors.primary,
        background = CoreUIColors.black2,
        accent = CoreUIColors.accent,
        warn = CoreUIColors.warn,
        text = CoreUIColors.white1,
        textLight = CoreUIColors.grey3;
}
