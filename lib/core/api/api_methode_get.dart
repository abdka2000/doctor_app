import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'api_methods.dart';

import '../entity/error_entity_response.dart';
import '../error/exception.dart';
import 'api_url.dart';

class ApiGetMethods<T> {
  final String contentType;
  late Map<String, String> headers;
  final Map<String, String>? addHeader;
  ApiGetMethods({this.contentType = "application/json", this.addHeader}) {
    headers = ApiMethods().headersConst(contentType: contentType);
    if (addHeader != null && (addHeader?.isNotEmpty ?? false)) {
      headers.addAll(addHeader ?? {});
    }
  }

  //? using this function for all get requests
  //? when the parameter does not needed set as empty value
//? getApi({required Map<String, String>? headers}){
  Future<T> get({
    required String url,
    required T Function(http.Response response) data,
    Map<String, dynamic>? path,
    Map<String, dynamic>? query,
  }) async {
    query?.removeWhere((key, value) => value == null);
    //? for request :
    ApiMethods().logRequest(url: url, query: query, path: path);
    http.Response response;
    try {
      if ((path?.isNotEmpty ?? false) && (query?.isNotEmpty ?? false)) {
        response = await http
            .get(
                ApiUrl(url).getPath(path ?? {}).getQuery(query ?? {}).getLink(),
                headers: headers)
            .timeout(
              const Duration(seconds: 30), //? Set the timeout duration here
            );
      } else if (query?.isNotEmpty ?? false) {
        response = await http
            .get(ApiUrl(url).getQuery(query ?? {}).getLink(), headers: headers)
            .timeout(
              const Duration(seconds: 30), //? Set the timeout duration here
            );
      } else if (path?.isNotEmpty ?? false) {
        response = await http
            .get(ApiUrl(url).getPath(path ?? {}).getLink(), headers: headers)
            .timeout(
              const Duration(seconds: 30), //? Set the timeout duration here
            );
      } else {
        response =
            await http.get(ApiUrl(url).getLink(), headers: headers).timeout(
                  const Duration(seconds: 30), //? Set the timeout duration here
                );
      }

      ApiMethods().logResponse(response, url);
      //? this is for request function data :
      if (response.statusCode == 200) {
        return data(response);
      } else if (response.statusCode == 503) {
        throw ServerException(
            response: errorResponseEntityFromJson(
          str: '{}',
          code: response.statusCode,
        ));
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
