import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AppNetworkException extends AppException {
  const AppNetworkException(super.message);

  /// Return error from system exception
  static AppException fromException(Object e, StackTrace stackTrace) {
    if (e is SocketException) {
      return const AppNetworkException('No internet connection');
    } else if (e is TimeoutException) {
      return AppNetworkException('TimeoutException after ${e.duration}');
    } else if (e is FormatException) {
      return AppFormatException(e.message);
    } else if (e is ClientException) {
      return AppException(e.message, stackTrace);
    } else {
      return AppException.fromException(e, stackTrace);
    }
  }

  /// Parsing a response error from the server
  static AppException? fromResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return null;
      default:
        break;
    }

    String message = '';
    try {
      if (response.bodyBytes.isNotEmpty) {
        final decodedResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        ) as Map;

        if (decodedResponse.containsKey('msg')) {
          message = decodedResponse['msg'].toString();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    switch (response.statusCode) {
      case 401:
      case 403:
        return UnauthorizedException(
          response.request?.url.toString() ?? 'undefined url',
          serverCode: response.statusCode,
          message: message,
        );
      case 404:
        return AppNotFoundException(
          response.request?.url.toString() ?? 'not found',
          serverCode: response.statusCode,
          message: message,
        );
      case 429:
        return TooManyRequestsException(
          response.request?.url.toString() ?? 'undefined url',
          serverCode: response.statusCode,
        );
      default:
        break;
    }

    if (message.isEmpty) {
      message = 'Unhandled.';
    }
    return AppServerException(
      response.request?.url.toString() ?? 'undefined url',
      response.statusCode,
      message,
    );
  }

  /// Parsing a response error from the server [http.StreamedResponse]
  static Future<AppException?> fromStreamResponse(
    StreamedResponse response,
  ) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        return null;
      default:
        break;
    }

    String message = response.reasonPhrase ?? '';

    try {
      final bytesString = await response.stream.bytesToString();
      message += '\n$bytesString';
    } catch (e) {
      if (kDebugMode) print(e);
    }
    switch (response.statusCode) {
      case 401:
      case 403:
        return UnauthorizedException(
          response.request?.url.toString() ?? 'undefined url',
          serverCode: response.statusCode,
          message: message,
        );
      case 429:
        return TooManyRequestsException(
          response.request?.url.toString() ?? 'undefined url',
          serverCode: response.statusCode,
        );
      default:
        break;
    }

    if (message.isEmpty) {
      message = 'Unhandled.';
    }
    return AppServerException(
      response.request?.url.toString() ?? 'undefined url',
      response.statusCode,
      message,
    );
  }
}

class AppServerException extends AppException {
  final String url;
  final int? serverCode;

  const AppServerException(this.url, this.serverCode, String message)
      : super(message);

  @override
  String toString() =>
      'Server exception:\nURL: $url\nServer Code: $serverCode\nMessage: $message';
}

class AppNotFoundException extends AppServerException {
  const AppNotFoundException(String url, {int? serverCode, String? message})
      : super(url, serverCode ?? 404, message ?? 'Not found');

  @override
  String toString() =>
      'Not found exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message';
}

class UnauthorizedException extends AppServerException {
  const UnauthorizedException(String url, {int? serverCode, String? message})
      : super(url, serverCode ?? 103, message ?? 'Unauthorized');

  @override
  String toString() =>
      'Unauthorized exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message';
}

class TooManyRequestsException extends AppServerException {
  const TooManyRequestsException(
    String url, {
    required int serverCode,
    String message = 'Too many requests',
  }) : super(url, serverCode, message);

  @override
  String toString() =>
      'Too many requests exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message';
}
