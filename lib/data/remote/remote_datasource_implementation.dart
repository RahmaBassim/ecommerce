

import 'package:dio/dio.dart';
import 'package:e_commerce/data/remote/remote_datasource.dart';
import 'package:e_commerce/shared/static/constants.dart';
import 'package:e_commerce/shared/static/dio_helper.dart';

import '../../models/request/category_products_request/category_request.dart';
import '../../models/response/get_categories/get_categories.dart';
import '../../models/response/get_category_products/get_catedory_products_model.dart';

class RemoteDatasourceImplementation extends RemoteDatasource{
  final Dio dio;
  final DioHelper dioHelper;
  RemoteDatasourceImplementation({required this.dio, required this.dioHelper});

  
  @override
  Future<CategoryProductsResponseModel> categoryProducts({required CategoryProductsRequest request}) async {
    final response = await dio.get('${Constants.categoryProducts}${request.categoryName}');
    if (response.statusCode == 200){
      return CategoryProductsResponseModel.fromJson(json: response.data);
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
  }
