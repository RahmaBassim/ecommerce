

import 'package:dio/dio.dart';
import 'package:e_commerce/data/remote/remote_datasource.dart';
import 'package:e_commerce/shared/static/dio_helper.dart';

class RemoteDatasourceImplementation extends RemoteDatasource{
  final Dio dio;
  final DioHelper dioHelper;
  RemoteDatasourceImplementation({required this.dio, required this.dioHelper});

}