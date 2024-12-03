part of '../core.dart';

final class Optional<T> {
  final T value;

  const Optional(this.value);

  static T getValue<T>(Optional<T>? value, T oldValue) {
    if (value == null) return oldValue;
    return value.value;
  }
}

extension OptionalExtension on Object {
  Optional asOptional() => Optional(this);
}
