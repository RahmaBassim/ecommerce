

import '../../models/request/category_products_request/category_request.dart';
import '../../models/response/get_categories/get_categories.dart';
import '../../models/response/get_category_products/get_catedory_products_model.dart';

abstract class RemoteDatasource{

  Future<CategoryProductsResponseModel> categoryProducts({required CategoryProductsRequest request});
  Future<GetCategoriesResponse> categories();
}