// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hosptel_app/core/entity/error_entity_response.dart';
import 'package:hosptel_app/core/error/exception.dart';
import 'package:path_provider/path_provider.dart';

class ApiDownloadMethods<T> {
  //? Dio :
  Dio dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 30)));

  Future<T> downlad(
      {required String url,
      required String fileName,
      required T Function(Response response) data}) async {
    //? Get Directody For Download :
    final directory = await getDownloadsDirectory();

    //? Get Extension :
    final extension = url.split('.').last;

    //? Make File Name in Directory :
    final fileDownloadName = "$fileName.$extension";

    try {
      //? this for request :
      Response response =
          await dio.download(url, '${directory!.path}/$fileDownloadName');

      //? check the response :
      if (response.statusCode == 200) {
        return data(response);
      } else if (response.statusCode == 503) {
        throw ServerException(
            response: errorResponseEntityFromJson(
          str: '{}',
          code: response.statusCode!,
        ));
      } else {
        throw ServerException(
            response: errorResponseEntityFromJson(
                str: response.data, code: response.statusCode!));
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
