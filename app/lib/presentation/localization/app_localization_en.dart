import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get ghListTitle => 'Tent Controllers';

  @override
  String get blDevicesListTitle => 'Add controller';

  @override
  String get blDevicesListTurnedOffTitle => 'Bluetooth is turned off';

  @override
  String get blDevicesListTurnedOffDesc => 'Please turn on bluetooth in settings to start searching for available devices';

  @override
  String get blDevicesListTurnedOffSettings => 'To settings';

  @override
  String get blDevicesListEmptyTitle => 'No devices found';

  @override
  String get blDevicesListEmptyDesc => 'Make sure device is turned on and you are close enough';

  @override
  String get ghAddSetName => 'Set name';

  @override
  String get ghAddSelectPlants => 'Select plants';

  @override
  String ghAddSelectedPlants(int count) {
    return '($count selected)';
  }

  @override
  String get ghAddSelectApply => 'Apply';

  @override
  String get ghListEmptyTitle => 'No controllers added';

  @override
  String get ghListEmptyDesc => 'Press Plus button to add new controller';
}
