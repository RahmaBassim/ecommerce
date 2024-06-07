

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/request/login_request/login_request.dart';
import 'package:e_commerce/models/response/get_categories/get_categories.dart';
import 'package:e_commerce/models/response/login_response/login_response.dart';
import 'package:e_commerce/models/response/signup_response/signup_response.dart';

import '../models/request/category_products_request/category_request.dart';
import '../models/response/get_category_products/get_catedory_products_model.dart';

abstract class Repository {
  Future<Either<CategoryProductsErrorResponse, ProductsResponseModel>> categoryProducts({required CategoryProductsRequest request});
  Future<Either<CategoryProductsErrorResponse, ProductsResponseModel>> allProducts();
  Future<Either<CategoriesErrorResponse, GetCategoriesResponse>> categories();
  Future<Either<SignupErrorResponse, String>> signup({required UserModel request});
  Future<Either<LoginErrorResponseModel, UserModel>> login({required LoginRequestModel request});
  Future<Either<SignupErrorResponse, UserModel>> saveUSer({required UserModel request});
}