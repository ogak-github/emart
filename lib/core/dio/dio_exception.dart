import 'package:dio/dio.dart';

typedef DioError = DioException;

class DioExceptions implements Exception {
  String message = "";

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request Cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection Timeout";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive Timeout";
        break;
      case DioExceptionType.badResponse:
        message = //dioError.response?.data;
            _responseError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send Timeout";
        break;
      case DioExceptionType.unknown:
        message = "Unexpected error occured";
        break;
      default:
        message = "Something went worng";
        break;
    }
  }

  String _responseError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 420:
        return 'Session Expired';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Server unavailable';
      default:
        return "Please try again later";
    }
  }

  @override
  String toString() => message;
}
