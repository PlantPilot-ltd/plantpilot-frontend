part of '/core_ui.dart';

/// App theme repository.
///
/// Accessing a repository in code:
/// `AppTheme.of(context)`.
///
/// REQUIRED: AppTheme should be injected with [Provider] to the whole app
/// so [keepstuff_shared_ui] package can use it.
final class CoreUIAppTheme extends ChangeNotifier {
  static const String _appThemeCode = "APP_THEME_CODE";

  CoreUIThemeData _themeData;

  CoreUIThemeData get themeData => _themeData;

  bool get isDarkTheme => _themeData.themeCode == "DARK";
  String get themeCode => _themeData.themeCode;
  ThemeData get materialAppTheme => _themeData.materialAppTheme;
  CoreUIColorScheme get colorScheme => _themeData.colorScheme;
  SystemUiOverlayStyle get systemUiOverlayStyle =>
      _themeData.systemUiOverlayStyle;

  CoreUIAppTheme(this._themeData);

  static CoreUIAppTheme of(BuildContext context, {bool listen = true}) =>
      Provider.of<CoreUIAppTheme>(context, listen: listen);

  Future<void> setTheme(CoreUIThemeData themeData) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(_appThemeCode, themeData.themeCode);
    _themeData = themeData;
    notifyListeners();
  }

  static Future<CoreUIThemeData> getDataFromCache({
    CoreUIThemeData? defaultData,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? code = sharedPreferences.getString(_appThemeCode);
    return CoreUIThemeData.fromCode(code, defaultData: defaultData);
  }
}
