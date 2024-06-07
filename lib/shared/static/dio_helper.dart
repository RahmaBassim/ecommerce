

import 'package:dio/dio.dart';
import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:e_commerce/shared/static/constants.dart';
import 'package:e_commerce/shared/static/service_locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio init(){
    final dio = Dio(BaseOptions(
      //baseUrl: Constants.baseUrl,
      receiveDataWhenStatusError: true,
      followRedirects: false,
      receiveTimeout: const Duration(seconds: 1*30),
      validateStatus: (state){
        if (state == 401) {
          _logout();
          return false;
        }
        return state! < 500;
      }
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    return dio;
  }
  void addHeaders(){
    final token = sl<LocalDatasource>().getToken();
    if (token.isEmpty) return;
    sl<Dio>().options.headers = {
      Constants.authorization: "${Constants.token} $token"
    };
  }
  void removeHeader(){
    sl<Dio>().options.headers = {};
  }
  Future<void> _logout() async {
    await sl<LocalDatasource>().removeToken();
    removeHeader();
  }
}