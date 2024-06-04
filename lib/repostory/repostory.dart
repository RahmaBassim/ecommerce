

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/response/get_categories/get_categories.dart';

import '../models/request/category_products_request/category_request.dart';
import '../models/response/get_category_products/get_catedory_products_model.dart';

abstract class Repository {
  Future<Either<CategoryProductsErrorResponse, CategoryProductsResponseModel>> categoryProducts({required CategoryProductsRequest request});
  Future<Either<CategoriesErrorResponse, GetCategoriesResponse>> categories();
}