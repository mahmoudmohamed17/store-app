import 'package:dio/dio.dart';

abstract class ApiFailure {
  final String errorMsg;

  ApiFailure({required this.errorMsg});
}

class ServiceFailure extends ApiFailure {
  ServiceFailure({required super.errorMsg});
  factory ServiceFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure(errorMsg: 'Connection timeout.');

      case DioExceptionType.sendTimeout:
        return ServiceFailure(errorMsg: 'Send timeout.');

      case DioExceptionType.receiveTimeout:
        return ServiceFailure(errorMsg: 'Receive timeout.');

      case DioExceptionType.badCertificate:
        return ServiceFailure(errorMsg: 'Bad certificate.');

      case DioExceptionType.badResponse:
        return ServiceFailure.fromBadResponse(e.response!.statusCode!);

      case DioExceptionType.cancel:
        return ServiceFailure(errorMsg: 'Connection canceled.');

      case DioExceptionType.connectionError:
        return ServiceFailure(errorMsg: 'No internet connection.');

      case DioExceptionType.unknown:
        return ServiceFailure(errorMsg: 'Unknwon error.');
    }
  }
  factory ServiceFailure.fromBadResponse(int statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(errorMsg: 'There\'s a missing arguments.');
    } else if (statusCode == 404) {
      return ServiceFailure(errorMsg: 'Request not found, try again later.');
    } else if (statusCode == 500) {
      return ServiceFailure(
          errorMsg: 'Internet server error, try again later.');
    } else {
      return ServiceFailure(
          errorMsg: 'Oops! There was an error, try again later.');
    }
  }
}
