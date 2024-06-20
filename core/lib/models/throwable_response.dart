part of '../core.dart';

class ThrowableResponse<T> {
  final T? result;
  final Exception? failure;

  ThrowableResponse._(this.result, this.failure);

  ThrowableResponse.success(T result) : this._(result, null);
  ThrowableResponse.failure(Exception failure) : this._(null, failure);

  void handle({
    void Function(T result)? onSuccess,
    void Function(AppException e)? onFailure,
  }) {
    if (result != null) {
      onSuccess?.call(result as T);
    } else if (failure != null) {
      onFailure?.call(failure as AppException);
    }
  }
}
