
import 'dart:io';

import 'package:dio/dio.dart';

class ErrorResponseCode{
  static String CheckError(int? code){
    String newCode = "";
    if(code==ResponseCode.BAD_REQUEST){
      newCode = '';
    }else if(code == ResponseCode.CACHE_ERROR){
      newCode = '';
    }else if(code == ResponseCode.CONNECT_TIMEOUT){
      newCode = '';
    }else if(code == ResponseCode.FORBIDDEN){
      newCode = '';
    }else if(code == ResponseCode.NOT_FOUND){
      newCode = '';
    }else if(code == ResponseCode.NO_INTERNET_CONNECTION){
      newCode = '';
    }else if(code == ResponseCode.NO_CONTENT){
      newCode = '';
    }else if(code == ResponseCode.INTERNAL_SERVER_ERROR){
      newCode = '';
    }else if(code == ResponseCode.RECIEVE_TIMEOUT){
      newCode = '';
    }else if(code == ResponseCode.SEND_TIMEOUT){
      newCode = '';
    }else if(code == ResponseCode.DEFAULT){
      newCode = '';
    }
    return newCode;
  }
}





class ErrorHandler implements Exception {
  late String failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioExceptionType) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  String _handleError(DioExceptionType error) {
    if(error is SocketException){
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    }
    switch (error) {
      case DioExceptionType.unknown:
        {
          return DataSource.DEFAULT.getFailure();
        }
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
    // check if the response itself coming with null!!
      case DioExceptionType.badResponse:
        return DataSource.BAD_REQUEST.getFailure();
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();

      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.DEFAULT.getFailure();
    }
  }
}




enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}


class ResponseMessage {
  static String SUCCESS = ''; // success with data
  static String NO_CONTENT =
      ''; // success with no data (no content)
  static String BAD_REQUEST =
      ''; // failure, API rejected request
  static String UNAUTORISED =
      ''; // failure, user is not authorised
  static String FORBIDDEN =
      ''; //  failure, API rejected request
  static String INTERNAL_SERVER_ERROR =
      ''; // failure, crash in server side
  static String NOT_FOUND =
      ''; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = '';
  static String CANCEL = '';
  static String RECIEVE_TIMEOUT = '';
  static String SEND_TIMEOUT = '';
  static String CACHE_ERROR = '';
  static String NO_INTERNET_CONNECTION = '';
  static String DEFAULT = '';
}
class ResponseCode {
  // remote status code
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int NOT_FOUND = 404; // failure, not found
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}
extension DataSourceExtension on DataSource {
  String getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return (ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return (ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ( ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return (ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return (ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return (ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return (
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return (ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ( ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return (ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ( ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return (ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return (ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return (ResponseMessage.DEFAULT);
    }
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}