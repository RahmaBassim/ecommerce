import 'package:e_commerce/models/request/login_request/login_request.dart';

import '../../models/response/signup_response/signup_response.dart';

abstract class FirebaseDatasource{
  Future<UserModel> login({required LoginRequestModel request});
  Future<UserModel> saveUser({required UserModel request});
}