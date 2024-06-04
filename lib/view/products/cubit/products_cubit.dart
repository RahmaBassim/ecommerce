import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/request/category_products_request/category_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../../repostory/repostory.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  Repository repository;
  CategoryProductsResponseModel? categoryProducts;
  ProductsCubit({required this.repository}) : super(ProductsInitial());

  static ProductsCubit get(context)=> BlocProvider.of(context);

  getCategoryProduct(String categoryName) async {
    emit(ProductsLoadingState());
    /*
    String token = sl<LocalDatasource>().getToken();
    if(token.isEmpty){
      emit(ProductsEmptyState());
      return;
    }*/
    final categoryProductOrFailure = await repository.categoryProducts(request: CategoryProductsRequest(
      categoryName: categoryName
    ));
    categoryProductOrFailure.fold(
        (failure)=> emit(ProductsErrorState(message: failure.message)),
        (success) {
          categoryProducts = success;
          emit(ProductsSuccessState(categoryResponseModel: success));
        }
    );
  }
}
