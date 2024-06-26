import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';

/// all api method with configuration to send http request
class ApiMethods {
  Map<String, String> headersConst({required String contentType}) {
    return {
      'Content-Type': contentType,
      "Accept": "application/json",
      // "Authorization": "Bearer ${AppSharedPreferences.getToken()}"
    };
  }

  Logger logger() {
    return Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          // number of method calls to be displayed
          errorMethodCount: 0,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // noBoxingByDefault: true,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: false,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }

  void logRequest({
    required String url,
    Map<String, dynamic>? query,
    dynamic body,
    Map<String, dynamic>? path,
    List<File>? files,
  }) {
    String msg = '';
    if (query != null) msg += '\n query: ${jsonEncode(query)}';
    if (body != null) msg += '\n body: ${jsonEncode(body)}';
    if (path != null) msg += '\n path: ${jsonEncode(path)}';
    if (files != null) {
      msg += '\n files ${files.map((e) => e.path).toList().toString()}';
    }

    logger().i('$url \n${splitMessage(msg)}');
  }

//! print response
  void logResponse(http.Response response, String url) {
    logger().w('${response.statusCode}  $url \n${splitMessage(response.body)}');
  }
}

extension StringSplitByLength on String {
  List<String> splitByLength(int length, {bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      String piece = substring(i, offset >= this.length ? this.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }
}

String splitMessage(dynamic map) {
  var m = '';
  if (map == null) return m;

  if (map is Map) m = jsonEncode(map);
  if (map is String) m = map;

  if (m.length > 800) {
    final list = m.splitByLength(800);
    var message = '';
    for (var element in list) {
      message += '$element \n';
    }
    return message;
  }
  return m;
}
