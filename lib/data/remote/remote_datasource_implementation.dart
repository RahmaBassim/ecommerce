

import 'package:dio/dio.dart';
import 'package:e_commerce/data/remote/remote_datasource.dart';
import 'package:e_commerce/shared/static/constants.dart';
import 'package:e_commerce/shared/static/dio_helper.dart';

import '../../models/request/category_products_request/category_request.dart';
import '../../models/request/login_request/login_request.dart';
import '../../models/request/signup_request/signup_request.dart';
import '../../models/response/get_categories/get_categories.dart';
import '../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../models/response/login_response/loginResponse.dart';
import '../../models/response/signup_response/signup_response.dart';

class RemoteDatasourceImplementation extends RemoteDatasource{
  final Dio dio;
  final DioHelper dioHelper;
  RemoteDatasourceImplementation({required this.dio, required this.dioHelper});

  
  @override
  Future<ProductsResponseModel> allProducts() async {
    final response = await dio.get(Constants.allProducts);
    if (response.statusCode == 200){
      return ProductsResponseModel.fromJson(json: response.data);
    }else {
      throw CategoryProductsErrorResponse.fromJson(response.data);
    }
  }
  @override
  Future<ProductsResponseModel> categoryProducts({required CategoryProductsRequest request}) async {
    final response = await dio.get('${Constants.categoryProducts}${request.categoryName}');
    if (response.statusCode == 200){
      return ProductsResponseModel.fromJson(json: response.data);
    }else {
      throw CategoryProductsErrorResponse.fromJson(response.data);
    }
  }
  @override
  Future<GetCategoriesResponse> categories() async {
    final response = await dio.get(Constants.categories);
    if( response.statusCode == 200){
      return GetCategoriesResponse.fromJson(categories: response.data);
    }else {
      throw CategoriesErrorResponse(message: response.data);
    }
    }
    
  @override
  Future<String> signup({required UserModel request}) async {
    final response = await dio.post(Constants.signup);
    if (response.statusCode == 200){
      return response.data['id'].toString();
    }else {
      throw SignupErrorResponse.fromJson(response.data);
    }
  } 
  
  @override
  Future<LoginSuccessResponseModel> login({required LoginRequestModel request}) async {
    final response = await dio.post(Constants.login,data: request.toJson());
    if (response.statusCode == 200){
      return LoginSuccessResponseModel.fromJson(response.data);
    }else {
      throw LoginErrorResponseModel.fromJson(response.data);
    }
  }
  }
