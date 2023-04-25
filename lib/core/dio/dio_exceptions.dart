import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = "";

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request Cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection Timeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive Timeout";
        break;
      case DioErrorType.badResponse:
        message = _responseError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send Timeout";
        break;
      case DioErrorType.unknown:
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
        return error['message'] ?? 'Bad request';
      case 401:
        return error['message'] ?? 'Unauthorized';
      case 403:
        return error['message'] ?? 'Forbidden';
      case 404:
        return error['message'];
      case 420:
        return 'Session Expired';
      case 500:
        return error['message'] ?? 'Internal server error';
      case 502:
        return error['message'] ?? 'Server unavailable';
      default:
        return "Please try again later";
    }
  }

  @override
  String toString() => message;
}
