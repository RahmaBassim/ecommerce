

import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:e_commerce/shared/static/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/static/service_locator.dart';


// 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
class LocalDatasourceImplementation extends LocalDatasource{
  SharedPreferences prefsHelper;
  LocalDatasourceImplementation({required this.prefsHelper});

  @override
  Future<bool> setData({
    required String key,
    required dynamic value
  }) async {
    if (value is String) {
      return await prefsHelper.setString(key, value);
    }
    else if (value is int){
      return await prefsHelper.setInt(key, value);
    }
    else if (value is bool){
      return await prefsHelper.setBool(key, value);
    }
    else if (value is double){
      return await prefsHelper.setDouble(key, value);
    }
    else if ( value is List<String>){
      return await prefsHelper.setStringList(key, value);
    }
    else {
      return false;
    }
  }

  @override
  String getData(String key){
    return sl<SharedPreferences>().getString(key) ?? "";
  }
  /*@override
  Future<bool> setLogin(bool isGuest) async {
    return await sl<SharedPreferences>().setBool(Constants.login, isGuest);
  }*/

  @override
  String getToken() {
    return prefsHelper.getString(Constants.token)??"";
  }

  @override
  Future<bool> disableOnboarding()async{
    return await prefsHelper.setBool(Constants.onboarding,true) ;
  }
  @override
  bool getOnboarding(){
    return prefsHelper.getBool(Constants.onboarding) ?? false;
  }

  @override
  removeToken() async {
    await prefsHelper.remove(Constants.token);
  }

}