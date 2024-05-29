

import 'package:e_commerce/data/local/local_datasource.dart';
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

  @override
  bool getOnboarding() {
    // TODO: implement getOnboarding
    throw UnimplementedError();
  }

  @override
  String getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future removeToken() {
    // TODO: implement removeToken
    throw UnimplementedError();
  }


}