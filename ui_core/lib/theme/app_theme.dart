part of '/ui_core.dart';

/// App theme repository.
///
/// Accessing a repository in code:
/// `AppTheme.of(context)`.
///
/// REQUIRED: AppTheme should be injected with [Provider] to the whole app
/// so [keepstuff_shared_ui] package can use it.
class AppTheme extends ChangeNotifier {
  static const String _appThemeCode = "APP_THEME_CODE";

  AppThemeData _themeData;

  AppThemeData get themeData => _themeData;

  bool get isDarkTheme => _themeData.themeCode == "DARK";
  String get themeCode => _themeData.themeCode;
  ThemeData get materialAppTheme => _themeData.materialAppTheme;
  AppColorScheme get colorScheme => _themeData.colorScheme;
  SystemUiOverlayStyle get systemUiOverlayStyle =>
      _themeData.systemUiOverlayStyle;

  AppTheme(this._themeData);

  static AppTheme of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppTheme>(context, listen: listen);

  Future<void> setTheme(AppThemeData themeData) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(_appThemeCode, themeData.themeCode);
    _themeData = themeData;
    notifyListeners();
  }

  static Future<AppThemeData> getDataFromCache({
    AppThemeData? defaultData,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? code = sharedPreferences.getString(_appThemeCode);
    return AppThemeData.fromCode(code, defaultData: defaultData);
  }
}
