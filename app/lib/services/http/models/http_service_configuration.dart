import 'dart:async';

import 'package:app/services/index.dart';
import 'package:core/core.dart';
import 'package:http/http.dart';

class HttpServiceConfiguration {
  final EnvironmentType environmentType;

  final URLProtocol urlProtocol;
  final String serverUrl;
  final String serverApiUrl;

  final int refreshTokenAttempts;

  final FutureOr<String?> Function() getAuthorizationToken;
  final FutureOr<bool> Function(Response response) refreshAuthorizationToken;
  final Exception? Function(Response, Exception?) onUnauthorizedException;

  const HttpServiceConfiguration({
    required this.environmentType,
    required this.urlProtocol,
    required this.serverUrl,
    required this.serverApiUrl,
    required this.refreshTokenAttempts,
    required this.getAuthorizationToken,
    required this.refreshAuthorizationToken,
    required this.onUnauthorizedException,
  });

  Uri createServerUri(
    String unencodedPath, {
    Map<String, dynamic>? queryParameters,
  }) {
    switch (urlProtocol) {
      case URLProtocol.http:
        return Uri.http(
          serverUrl,
          '$serverApiUrl$unencodedPath',
          queryParameters,
        );
      case URLProtocol.https:
        return Uri.https(
          serverUrl,
          '$serverApiUrl$unencodedPath',
          queryParameters,
        );
    }
  }
}
