import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../entity/error_entity_response.dart';
import '../error/exception.dart';
import 'api_methods.dart';
import 'api_url.dart';

class ApiDeleteMethods<T> {
  final String contentType;
  late Map<String, String> headers;
  final Map<String, String>? addHeader;
  ApiDeleteMethods({this.contentType = "application/json", this.addHeader}) {
    headers = ApiMethods().headersConst(contentType: contentType);
    if (addHeader != null && (addHeader?.isNotEmpty ?? false)) {
      headers.addAll(addHeader ?? {});
    }
  }

  /// using this function for all delete requests
  /// when the parameter does not needed set as empty value
  Future<T> delete(
      {required String url,
      required T Function(Response response) data,
      path,
      Map<String, dynamic>? query}) async {
    ApiMethods().logRequest(url: url, query: query, path: {'': path});
    http.Response response;

    try {
      if (query?.isNotEmpty ?? false) {
        response = await http
            .delete(ApiUrl(url).getQuery(query ?? {}).getLink(),
                headers: headers)
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => http.Response("Time Out", -1),
            );
      } else {
        response =
            await http.delete(ApiUrl(url).getLink(), headers: headers).timeout(
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
