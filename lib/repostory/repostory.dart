

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/request/login_request/login_request.dart';
import 'package:e_commerce/models/request/signup_request/signup_request.dart';
import 'package:e_commerce/models/response/get_categories/get_categories.dart';
import 'package:e_commerce/models/response/login_response/loginResponse.dart';
import 'package:e_commerce/models/response/signup_response/signup_response.dart';

import '../models/request/category_products_request/category_request.dart';
import '../models/response/get_category_products/get_catedory_products_model.dart';

abstract class Repository {
  Future<Either<CategoryProductsErrorResponse, CategoryProductsResponseModel>> categoryProducts({required CategoryProductsRequest request});
  Future<Either<CategoryProductsErrorResponse, CategoryProductsResponseModel>> allProducts({required CategoryProductsRequest request});
  Future<Either<CategoriesErrorResponse, GetCategoriesResponse>> categories();
  Future<Either<SignupErrorResponse, SignupResponseModel>> signup({required SignupRequestModel request});
  Future<Either<LoginErrorResponseModel, LoginSuccessResponseModel>> login({required LoginRequestModel request});
}