import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationRu extends AppLocalization {
  AppLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get ghListTitle => 'Контроллеры';

  @override
  String get blDevicesListTitle => 'Добавить контроллер';

  @override
  String get blDevicesListTurnedOffTitle => 'Bluetooth выключен';

  @override
  String get blDevicesListTurnedOffDesc => 'Пожалуйста, включите bluetooth в настройках, чтобы начать сканирование доступных устройств';

  @override
  String get blDevicesListTurnedOffSettings => 'В настройки';

  @override
  String get blDevicesListEmptyTitle => 'Контроллеры не найдены';

  @override
  String get blDevicesListEmptyDesc => 'Убедитесь, что устройство включено и вы находитесь достаточно близко';
}
