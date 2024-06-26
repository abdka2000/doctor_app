import '../entity/error_entity_response.dart';

class ServerException implements Exception {
  ErrorResponseEntity response;
  ServerException({
    required this.response,
  });
}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}
