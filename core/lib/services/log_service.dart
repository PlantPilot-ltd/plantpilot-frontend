part of '../core.dart';

abstract class LogService {
  const LogService();

  void logException(Object throwable, [StackTrace? stackTrace]);

  void logInfo(
    String name,
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]);
}
