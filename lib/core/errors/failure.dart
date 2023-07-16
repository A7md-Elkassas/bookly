import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(message: "connection Time out");

      case DioErrorType.sendTimeout:
        return ServerFailure(message: "connection Send Timed out ");

      case DioErrorType.receiveTimeout:
        return ServerFailure(message: "connection Recieve Timed out");

      case DioErrorType.badCertificate:
        return ServerFailure(message: "badCertificate with the server");

      case DioErrorType.badResponse:
        return ServerFailure.fromResponseError(
            error.response!.statusCode!, error.response!.data);

      case DioErrorType.cancel:
        return ServerFailure(message: "connection cancled with the server");

      case DioErrorType.connectionError:
        return ServerFailure(message: "connectionError with the server");

      case DioErrorType.unknown:
        return ServerFailure(message: "unknown error with the server");
    }
  }

  factory ServerFailure.fromResponseError(int statusCode, dynamic response) {
    if (statusCode >= 500 && statusCode < 600) {
      return ServerFailure(
          message: "There is a problem with server, please try again later");
    } else if (statusCode == 404) {
      return ServerFailure(
          message: "Your Request was not found, please try again later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    }
    return ServerFailure(message: "There is an error, please try later");
  }
}
