import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_en.dart';
import 'app_localization_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalization
/// returned by `AppLocalization.of(context)`.
///
/// Applications need to include `AppLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalization.localizationsDelegates,
///   supportedLocales: AppLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalization.supportedLocales
/// property.
abstract class AppLocalization {
  AppLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @ghListTitle.
  ///
  /// In en, this message translates to:
  /// **'Tent Controllers'**
  String get ghListTitle;

  /// No description provided for @blDevicesListTitle.
  ///
  /// In en, this message translates to:
  /// **'Add controller'**
  String get blDevicesListTitle;

  /// No description provided for @blDevicesListTurnedOffTitle.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is turned off'**
  String get blDevicesListTurnedOffTitle;

  /// No description provided for @blDevicesListTurnedOffDesc.
  ///
  /// In en, this message translates to:
  /// **'Please turn on bluetooth in settings to start searching for available devices'**
  String get blDevicesListTurnedOffDesc;

  /// No description provided for @blDevicesListTurnedOffSettings.
  ///
  /// In en, this message translates to:
  /// **'To settings'**
  String get blDevicesListTurnedOffSettings;

  /// No description provided for @blDevicesListEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get blDevicesListEmptyTitle;

  /// No description provided for @blDevicesListEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'Make sure device is turned on and you are close enough'**
  String get blDevicesListEmptyDesc;

  /// No description provided for @ghAddSetName.
  ///
  /// In en, this message translates to:
  /// **'Set name'**
  String get ghAddSetName;

  /// No description provided for @ghAddSelectPlants.
  ///
  /// In en, this message translates to:
  /// **'Select plants'**
  String get ghAddSelectPlants;

  /// No description provided for @ghAddSelectedPlants.
  ///
  /// In en, this message translates to:
  /// **'({count} selected)'**
  String ghAddSelectedPlants(int count);

  /// No description provided for @ghAddSelectApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get ghAddSelectApply;
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(lookupAppLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}

AppLocalization lookupAppLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationEn();
    case 'ru': return AppLocalizationRu();
  }

  throw FlutterError(
    'AppLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
