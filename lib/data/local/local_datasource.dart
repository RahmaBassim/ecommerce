abstract class LocalDatasource{
  Future<bool> setData({
    required String key,
    required dynamic value,
  });

  String getData(String key);
  String getToken();
  bool getOnboarding();
  Future removeToken();
}