import 'package:dio/dio.dart';

abstract class Failures {
  final String error;

  const Failures({required this.error});
}

class ServerFailure extends Failures {
  ServerFailure({required super.error});
  factory ServerFailure.fromDioException(DioException error) {
    String errorMessage = 'there was an error';
    switch (error.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            int.parse(error.response!.statusMessage!), error.response!.data);
      case DioExceptionType.receiveTimeout:
        errorMessage = 'server error';
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Please check the internet and send again';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'unKnown error';
        break;
      default:
        return ServerFailure(error: 'There was an error , Please try again');
    }
    return ServerFailure(error: errorMessage);
  }

  factory ServerFailure.fromResponse(int statescCode, dynamic json) {
    if (statescCode >= 400 && statescCode <= 403) {
      return ServerFailure(error: json['error']['message']);
    } else if (statescCode == 404) {
      return ServerFailure(error: 'Not found , Try again');
    } else if (statescCode == 500) {
      return ServerFailure(error: 'Server error');
    } else {
      return ServerFailure(error: 'There was an error , Please try again');
    }
  }
}
