import 'package:dio/dio.dart';
import 'package:movies_peaple/core/exception/client_exception.dart';
import 'package:movies_peaple/core/exception/server_exception.dart';

class ApplicationException implements Exception {}

class GenericException extends ApplicationException {
  final String message;

  GenericException({required this.message});
}

ApplicationException dioErrorDecoder({required DioError error}) {
  if (error.type == DioErrorType.response) {
    decodeResponseError(error: error);
  }
  throw const ClientException.networkError();
}

ApplicationException decodeResponseError({required DioError error}) {
  if (error.response!.statusCode.toString().contains("500")) {
    throw const ServerException.internalServerError();
  }
  throw GenericException(message: "Some thing went wrong");
}
