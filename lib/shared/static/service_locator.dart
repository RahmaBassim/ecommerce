

import 'package:dio/dio.dart';
import 'package:e_commerce/shared/static/shared_prefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'dio_helper.dart';

final sl = GetIt.instance;

class ServiceLocator {

  static Future<void> init() async {
    // register helpers datasource
  /*  await _registerLazySingletone();

    await _registerFactory();*/
  }
}

Future<void> _registerLazySingleton() async {
  if (sl.isRegistered<Dio>()){
    sl.unregister<Dio>();
    sl.unregister<DioHelper>();
    sl.unregister<DioHelper>();
  }
  final Dio dio = DioHelper().init();
  debugPrint('----------------------- register Dio: ${dio.options.baseUrl} -----------------');

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<DioHelper>(()=> DioHelper());

  final sharedPrefs = await PrefsHelper().init();

}