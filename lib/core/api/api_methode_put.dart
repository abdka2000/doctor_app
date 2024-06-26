import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../entity/error_entity_response.dart';
import '../error/exception.dart';
import 'api_methods.dart';
import 'api_url.dart';

class ApiPutMethods<T> {
  final String contentType;
  late Map<String, String> headers;
  final Map<String, String>? addHeader;
  ApiPutMethods({this.contentType = "application/json", this.addHeader}) {
    headers = ApiMethods().headersConst(contentType: contentType);
    if (addHeader != null && (addHeader?.isNotEmpty ?? false)) {
      headers.addAll(addHeader ?? {});
    }
  }

  /// using this function for all pu requests
  /// when the parameter does not needed set as empty value
  Future<T> put(
      {required String url,
      required T Function(Response response) data,
      required body,
      Map<String, dynamic>? query}) async {
    query?.removeWhere((key, value) => value == null);

    ApiMethods().logRequest(url: url, query: query, body: body);
    try {
      http.Response response;
      if (query?.isEmpty ?? false) {
        response = await http
            .put(ApiUrl(url).getLink(),
                body: jsonEncode(body), headers: headers)
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => http.Response("Time Out", -1),
            );
      } else {
        response = await http
            .put(ApiUrl(url).getQuery(query ?? {}).getLink(),
                body: jsonEncode(body), headers: headers)
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => http.Response("Time Out", -1),
            );
      }
      ApiMethods().logResponse(response, url);
      if (response.statusCode == 200) {
        return data(response);
      } else if (response.statusCode == 503) {
        throw ServerException(
            response: errorResponseEntityFromJson(
                str: '{}', code: response.statusCode));
      } else {
        throw ServerException(
            response: errorResponseEntityFromJson(
                str: response.body, code: response.statusCode));
      }
    } on TimeoutException catch (_) {
      // Handle timeout exception here
      if (kDebugMode) {
        print("Request timed out");
      }
      throw ServerException(
          response: errorResponseEntityFromJson(str: '{}', code: -1));
    } on ServerException catch (e) {
      // Handle other exceptions

      if (kDebugMode) {
        print("Error: ${e.response.error.code}");
      }
      rethrow;
    } catch (e) {
      // Handle other exceptions

      if (kDebugMode) {
        print("Error: $e");
      }
      throw ServerException(
          response: errorResponseEntityFromJson(str: '{}', code: 0));
    }
  }
}
