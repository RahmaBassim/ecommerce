import 'dart:async';

abstract class LocalDatasource{
  Future<bool> setData({
    required String key,
    required dynamic value,
  });

  String getData(String key);
  String getToken();
  Future<bool> disableOnboarding();
  bool getOnboarding();
  Future removeToken();
}