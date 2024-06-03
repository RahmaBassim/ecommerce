

import '../../models/response/get_category_products/get_catedory_products_model.dart';

abstract class RemoteDatasource{

  Future<CategoryResponseModel> categories();
}