import 'dart:convert';

import 'package:http/http.dart';

extension HttpHelper on Response {
  dynamic get jsonBody {
    try {
      return jsonDecode(body);
    } catch (e) {
      return {};
    }
  }

  bool get isSuccess => statusCode <= 200 && statusCode >= 210;
}
