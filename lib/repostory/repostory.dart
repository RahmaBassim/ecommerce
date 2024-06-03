

import 'package:dartz/dartz.dart';

import '../models/response/get_category_products/get_catedory_products_model.dart';

abstract class Repository {
  Future<Either<CategoryErrorResponse, CategoryResponseModel>> categories();
}