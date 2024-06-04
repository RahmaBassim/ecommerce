

import 'package:dartz/dartz.dart';
import 'package:e_commerce/models/response/get_categories/get_categories.dart';
import 'package:e_commerce/repostory/repostory.dart';
import 'package:flutter/cupertino.dart';

import '../data/remote/remote_datasource.dart';
import '../models/request/category_products_request/category_request.dart';
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
  Future<Either<CategoryProductsErrorResponse, CategoryProductsResponseModel>> categoryProducts({required CategoryProductsRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected){
      try{
        final categoryProduct = await remoteDatasource.categoryProducts(request: request);
        return Right(categoryProduct);
      } on CategoryProductsErrorResponse catch (error){
        debugPrint('-------------- onCategory error: $error --------------');
        return Left(error);
      } catch(error){
        debugPrint('-------------- categoryProduct error: $error --------------');
        return Left(CategoryProductsErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    }else{
      return Left(CategoryProductsErrorResponse(message: StringsManager.noInternetConnection));
    }
  }
  @override
  Future<Either<CategoriesErrorResponse, GetCategoriesResponse>> categories() async {
    final bool isConnected = await networkInfo.isConnected;
    if(isConnected){
      try{
        final category = await remoteDatasource.categories();
        return Right(category);
      }on CategoriesErrorResponse catch (error){
        debugPrint ('---------- onCategory error $error -----------');
        return Left(error);
      }catch (error){
        debugPrint ('----------- category error $error ---------');
        return Left(CategoriesErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    }else{
      return Left(CategoriesErrorResponse(message: StringsManager.noInternetConnection));
    }
  }
}