

import '../../models/request/category_products_request/category_request.dart';
import '../../models/request/login_request/login_request.dart';
import '../../models/request/signup_request/signup_request.dart';
import '../../models/response/get_categories/get_categories.dart';
import '../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../models/response/login_response/loginResponse.dart';
import '../../models/response/signup_response/signup_response.dart';

abstract class RemoteDatasource{

  Future<ProductsResponseModel> categoryProducts({required CategoryProductsRequest request});
  Future<ProductsResponseModel> allProducts();
  Future<GetCategoriesResponse> categories();
  Future<String> signup({required UserModel request});
  Future<LoginSuccessResponseModel> login({required LoginRequestModel request});
}