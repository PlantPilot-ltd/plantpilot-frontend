part of '../core.dart';

/// The model describes a custom application error
class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, [this.stackTrace]);

  @override
  String toString() => "[$runtimeType]\nMessage:$message";

  /// Return error from system exception
  static AppException fromException(Object e, StackTrace stackTrace) {
    if (e is AppException) {
      return e;
    } else if (e is FormatException) {
      return AppFormatException(e.message);
    } else if (e is Exception) {
      return AppException(e.toString(), stackTrace);
    } else {
      return AppUndefinedException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}

class AppUndefinedException extends AppException {
  const AppUndefinedException({
    String message = "Unexpected error",
    StackTrace? stackTrace,
  }) : super(message, stackTrace);
}

class AppFormatException extends AppException {
  const AppFormatException(super.message);
}
