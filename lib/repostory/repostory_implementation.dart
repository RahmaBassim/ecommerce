

import 'package:dartz/dartz.dart';
import 'package:e_commerce/repostory/repostory.dart';
import 'package:flutter/cupertino.dart';

import '../data/remote/remote_datasource.dart';
import '../models/response/get_category_products/get_catedory_products_model.dart';
import '../shared/resources/string_maneger.dart';
import '../shared/static/error_handler.dart';
import '../shared/static/internet_checker.dart';

class RepositoryImplementation extends Repository{
  final RemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  RepositoryImplementation({
    required this.remoteDatasource,
    required this.networkInfo
  });

  @override
  Future<Either<CategoryErrorResponse, CategoryResponseModel>> categories() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected){
      try{
        final category = await remoteDatasource.categories();
        return Right(category);
      } on CategoryErrorResponse catch (error){
        debugPrint('-------------- onCategory error: $error --------------');
        return Left(error);
      } catch(error){
        debugPrint('-------------- category error: $error --------------');
        return Left(CategoryErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    }else{
      return Left(CategoryErrorResponse(message: StringsManager.noInternetConnection));
    }
  }
}