

import 'package:dio/dio.dart';
import 'package:e_commerce/data/remote/remote_datasource.dart';
import 'package:e_commerce/shared/static/constants.dart';
import 'package:e_commerce/shared/static/dio_helper.dart';

import '../../models/response/get_category_products/get_catedory_products_model.dart';

class RemoteDatasourceImplementation extends RemoteDatasource{
  final Dio dio;
  final DioHelper dioHelper;
  RemoteDatasourceImplementation({required this.dio, required this.dioHelper});

  
  @override
  Future<CategoryResponseModel> categories() async {
    final response = await dio.get(Constants.categories);
    if (response.statusCode == 200){
      return CategoryResponseModel.fromJson(json: response.data);
    }else {
      throw CategoryErrorResponse.fromJson(response.data);
    }
  }
}