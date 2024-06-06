

import 'package:dio/dio.dart';
import 'package:e_commerce/data/firebase/firebase_datasource.dart';
import 'package:e_commerce/data/firebase/firebase_datasource_impl.dart';
import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:e_commerce/data/local/local_datasource_implementation.dart';
import 'package:e_commerce/repostory/repostory_implementation.dart';
import 'package:e_commerce/shared/resources/theme/theme_cubit.dart';
import 'package:e_commerce/shared/static/shared_prefrence.dart';
import 'package:e_commerce/view/home/cubit/categories_cubit.dart';
import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:e_commerce/view/user_authontication/login/login_cubit/login_cubit.dart';
import 'package:e_commerce/view/user_authontication/signup/cubit/signup_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/remote/remote_datasource.dart';
import '../../data/remote/remote_datasource_implementation.dart';
import '../../repostory/repostory.dart';
import '../../view/nav_bar/cubit/nav_bar_cubit.dart';
import 'dio_helper.dart';
import 'internet_checker.dart';
import 'navigation_service.dart';

final sl = GetIt.instance;

class ServiceLocator {

  static Future<void> init() async {
    // register helpers datasource
    await _registerLazySingleton();

    await _registerFactory();
  }
}

Future<void> _registerLazySingleton() async {
  if (sl.isRegistered<Dio>()){
    sl.unregister<Dio>();
    sl.unregister<DioHelper>();

  }
  final Dio dio = DioHelper().init();
  debugPrint('----------------------- register Dio: ${dio.options.baseUrl} -----------------');

  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<DioHelper>(()=> DioHelper());

  final sharedPrefs = await PrefsHelper().init();
  sl.registerLazySingleton<SharedPreferences>(()=> sharedPrefs);
  sl.registerLazySingleton<PrefsHelper>(()=> PrefsHelper());


  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker(),);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation(sl()),);
  sl.registerLazySingleton<RemoteDatasource>(
      ()=> RemoteDatasourceImplementation(dio: sl(), dioHelper: sl()));
  sl.registerLazySingleton<FirebaseDatasource>(
          ()=> FirebaseDatasourceImpl());
  sl.registerLazySingleton<LocalDatasource>(
      ()=> LocalDatasourceImplementation(prefsHelper: sl()));

  if(sl.isRegistered<Repository>()){
    sl.unregister<Repository>();
  }
  sl.registerLazySingleton<Repository>(() => RepositoryImplementation(remoteDatasource: sl(), networkInfo: sl(),firebaseDatasource: sl()),);
  if (sl.isRegistered<NavigationService>()){
    sl.unregister<NavigationService>();
  }
  sl.registerLazySingleton<NavigationService>(()=> NavigationService());
}

Future<void> _registerFactory() async {
  sl.registerFactory(()=> ProductsCubit(repository: sl()));
  sl.registerFactory(()=> CategoriesCubit(repository: sl()));
  sl.registerFactory(()=> LoginCubit(repository: sl()));
  sl.registerFactory(()=> SignupCubit(repository: sl()));
  sl.registerFactory(()=> ThemeCubit());

}