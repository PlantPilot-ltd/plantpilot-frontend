import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

class UnitTestMockClient extends MockClient {
  UnitTestMockClient() : super(_clientHandler);

  static Future<Response> _clientHandler(Request request) async {
    return Response(json.encode({}), 200);
  }
}
