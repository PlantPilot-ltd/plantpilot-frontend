import 'package:core/core.dart';

class AppCacheException extends AppException {
  const AppCacheException(super.message, super.stackTrace);

  static AppException fromException(Object e, StackTrace stackTrace) {
    if (e is Exception) {
      return AppCacheException(e.toString(), stackTrace);
    } else {
      return AppException.fromException(e, stackTrace);
    }
  }
}
