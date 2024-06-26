import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../entity/error_entity_response.dart';
import '../error/exception.dart';
import 'package:http/http.dart' as http;

import 'api_methods.dart';
import 'api_url.dart';

class ApiPostMethods<T> {
  final String contentType;
  late Map<String, String> headers;
  final Map<String, String>? addHeader;
  ApiPostMethods({this.contentType = "application/json", this.addHeader}) {
    headers = ApiMethods().headersConst(contentType: contentType);
    if (addHeader != null && (addHeader?.isNotEmpty ?? false)) {
      headers.addAll(addHeader ?? {});
    }
  }

  /// using this function for all post requests
  /// when the parameter does not needed set as empty value
  Future<T> post(
      {required String url,
      required T Function(Response response) data,
      body,
      encodeFormbody,
      Map<String, dynamic>? query,
      Map<String, String>? headeradd}) async {
    //? encode for data body
    //? this is content % this is fun use
    String encodeFormData(Map<String, String> data) {
      return data.keys.map((key) {
        final encodedKey = Uri.encodeComponent(key);
        final encodedValue = Uri.encodeComponent(data[key] ?? "");
        return '$encodedKey=$encodedValue';
      }).join('&');
    }

    body ??= {};
    //?

    query?.removeWhere((key, value) => value == null);

    ApiMethods().logRequest(
        url: url, query: query, body: body ?? encodeFormData(encodeFormbody));

    if (headeradd?.isNotEmpty ?? false) {
      headers.addAll(headeradd ?? {});
    }

    //? detetcted 1:
    try {
      http.Response response;
      if ((body != null || encodeFormbody != null) &&
          (query?.isNotEmpty ?? false)) {
        response = await http
            .post(
              ApiUrl(url).getQuery(query ?? {}).getLink(),
              body: encodeFormbody != null
                  ? encodeFormData(encodeFormbody)
                  : jsonEncode(body),
              headers: headers,
            )
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => http.Response("Time Out", -1),
            );
      } else if (query?.isNotEmpty ?? false) {
        response = await http
            .post(ApiUrl(url).getQuery(query ?? {}).getLink(), headers: headers)
            .timeout(
              const Duration(seconds: 30),
              onTimeout: () => http.Response("Time Out", -1),
            );
      } else {
        response = await http.post(ApiUrl(url).getLink(),
            body: jsonEncode(body), headers: headers);
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
