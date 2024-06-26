import 'package:flutter/foundation.dart';

/// api url generator
/// like base url , path , query
class ApiUrl {
  late String _link;

  //? host Name :
  static const String hostName = "doctormanagement-001-site1.ktempurl.com";
  //? base Url :
  static const String baseUrl = "https://$hostName/api/";

  ApiUrl(this._link);

  getLink() {
    if (kDebugMode) {
      print('Http request : $_link');
    }
    return Uri.parse(baseUrl + _link);
  }

  ApiUrl getQuery(Map<String, dynamic> query) {
    _link += '?';
    for (int i = 0; i < query.length; i++) {
      String key = query.keys.elementAt(i);
      var value = query.values.elementAt(i);

      if (value is List) {
        for (int i = 0; i < value.length; i++) {
          var it = value.elementAt(i);

          _link += '$key=$it';

          if (i < value.length - 1) {
            _link += '&';
          }
        }
      } else {
        _link += '$key=$value';
      }

      if (i != query.length - 1) _link += '&';
    }
    return this;
  }

  ApiUrl getHeader(Map<String, dynamic> header) {
    for (int i = 0; i < header.length; i++) {
      String key = header.keys.elementAt(i);
      var value = header.values.elementAt(i);

      if (value is List) {
        for (int i = 0; i < value.length; i++) {
          var it = value.elementAt(i);

          '$key=$it';

          if (i < value.length - 1) {
            '&';
          }
        }
      } else {
        '$key=$value';
      }

      if (i != header.length - 1) '&';
    }
    return this;
  }

  String getListAsQuery(List list) {
    String q = '';

    for (int i = 0; i < list.length; i++) {
      var it = list.elementAt(i);

      if (i < list.length - 1) {
        q += '$it;';
      } else {
        q += it.toString();
      }
    }

    return q;
  }

  /// this method
  /// make the link as a api required path
  /// only the unique path key can replaced
  ApiUrl getPath(Map<String, dynamic> path) {
    path.forEach((key, value) {
      _link = _link.replaceAll(key, value.toString());
    });
    return this;
  }
}
