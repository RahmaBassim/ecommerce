import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../../repostory/repostory.dart';
import '../../../shared/static/service_locator.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  Repository repository;
  CategoryResponseModel? categoryProducts;
  ProductsCubit({required this.repository}) : super(ProductsInitial());

  static ProductsCubit get(context)=> BlocProvider.of(context);

  getCategoryProduct() async {
    emit(ProductsLoadingState());
    String token = sl<LocalDatasource>().getToken();
    if(token.isEmpty){
      emit(ProductsEmptyState());
      return;
    }
    final categoryOrFailure = await repository.categories();
    categoryOrFailure.fold(
        (failure)=> emit(ProductsErrorState(message: failure.message)),
        (success) {
          categoryProducts = success;
          emit(ProductsSuccessState(categoryResponseModel: success));
        }
    );
  }
}
