import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'api_methods.dart';

import '../entity/error_entity_response.dart';
import '../error/exception.dart';
import 'api_url.dart';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

enum MultiPartRequestType { post, put }

class ApiMultiPartMethods<T> {
  final String contentType;
  late Map<String, String> headers;
  final Map<String, String>? addHeader;
  ApiMultiPartMethods({this.contentType = "application/json", this.addHeader}) {
    headers = ApiMethods().headersConst(contentType: contentType);
    if (addHeader != null && (addHeader?.isNotEmpty ?? false)) {
      headers.addAll(addHeader ?? {});
    }
  }

  Future<T> multiPart(
      {required String url,
      required T Function(Response response) data,
      String? path,
      MultiPartRequestType type = MultiPartRequestType.post,
      Map<String, dynamic>? fields,
      List<File>? files,
      File? file,
      String keyFile = 'File'}) async {
    fields?.removeWhere((key, value) => value == null);

    var uri = Uri.https(ApiUrl.hostName, '/api/$url/${path ?? ''}');

    var request = http.MultipartRequest(
      type.name.toUpperCase(),
      uri,
    );

    request.headers.addAll(headers);

    final f = getMultiPartMap(fields ?? {}, '');

    ApiMethods().logRequest(url: url, query: f, files: files, path: {'': path});

    request.fields.addAll(f);

    if (files != null) {
      for (var file in files) {
        // byte[]
        final bytes = await file.readAsBytes();

        //تقطيع مسار الملف لمصفوفة
        final pathSplit = file.path.split('/');
        //اسم الملف مع اللاحقة
        final nameFile =
            pathSplit.isNotEmpty ? pathSplit[pathSplit.length - 1] : '';
        //تقطيع اسم الملف واللاحقة لمصفوفة
        final typeSplit = nameFile.split('.');
        //لاحقة الملف
        final type =
            typeSplit.isNotEmpty ? typeSplit[typeSplit.length - 1] : '';

        final String typePars;
        if (type.toLowerCase() == 'png' ||
            type.toLowerCase() == 'jpeg' ||
            type.toLowerCase() == 'jpg' ||
            type.toLowerCase() == "gif" ||
            type.toLowerCase() == "webp") {
          typePars = 'image';
        } else {
          typePars = 'video';
        }

        final partFile = http.MultipartFile.fromBytes(
          keyFile,
          bytes,
          contentType: MediaType(typePars, type),
          // filename: basename(file.path),
        );

        request.files.add(partFile);
      }
    } else if (file != null) {
      // byte[]
      final bytes = await file.readAsBytes();

      //تقطيع مسار الملف لمصفوفة
      final pathSplit = file.path.split('/');
      //اسم الملف مع اللاحقة
      final nameFile =
          pathSplit.isNotEmpty ? pathSplit[pathSplit.length - 1] : '';
      //تقطيع اسم الملف واللاحقة لمصفوفة
      final typeSplit = nameFile.split('.');
      //لاحقة الملف
      final type = typeSplit.isNotEmpty ? typeSplit[typeSplit.length - 1] : '';

      final String typePars;
      if (type.toLowerCase() == 'png' ||
          type.toLowerCase() == 'jpeg' ||
          type.toLowerCase() == 'jpg' ||
          type.toLowerCase() == "gif" ||
          type.toLowerCase() == "webp") {
        typePars = 'image';
      } else {
        typePars = 'video';
      }

      final partFile = http.MultipartFile.fromBytes(
        keyFile,
        bytes,
        contentType: MediaType(typePars, type),
        // filename: basename(file.path),
      );

      request.files.add(partFile);
    }

    final res = await request.send();

    final respBytes = await res.stream.toBytes();
    final respStr = utf8.decode(respBytes);
    final respBytes1 = utf8.encode(respStr);
    var response =
        http.Response.bytes(respBytes1, res.statusCode, headers: res.headers);

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
  }

  Map<String, String> getMultiPartMap(Map<String, dynamic> map, String key) {
    Map<String, String> mMap = {};

    map.forEach(
      (keyMap, value) {
        if (value is List) {
          for (int i = 0; i < value.length; i++) {
            if (value[i] is Map) {
              mMap.addAll(getMultiPartMap(
                  value[i] as Map<String, dynamic>, '$key$keyMap[$i].'));
            } else {
              if (value[i] != null) {
                mMap['$key$keyMap[$i]'] = value[i].toString();
              }
            }
          }
        } else {
          if (value != null) {
            mMap['$key$keyMap'] = value.toString();
          }
        }
      },
    );

    return mMap;
  }
}
