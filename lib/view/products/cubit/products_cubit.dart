import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/request/category_products_request/category_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../../repostory/repostory.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  Repository repository;
  List<ProductModel> categoryProducts=[];
  List<ProductModel> allProducts=[];
  String? category;
  ProductsCubit({required this.repository}) : super(ProductsInitial());

  static ProductsCubit get(context)=> BlocProvider.of(context);

  getCategoryProduct(String categoryName) async {
    emit(ProductsLoadingState());
    // category = null;
    categoryProducts = [];
    category = categoryName;
    final categoryProductOrFailure = await repository.categoryProducts(request: CategoryProductsRequest(
      categoryName: categoryName
    ));
    categoryProductOrFailure.fold(
        (failure)=> emit(ProductsErrorState(message: failure.message)),
        (success) {
          categoryProducts = success.products;
          emit(ProductsSuccessState());
        }
    );
  }
  getAllProducts() async {

    if(allProducts.isNotEmpty){
      category = null;
      categoryProducts = [];
      emit(ProductsSuccessState());
        return ;
    }

    emit(ProductsLoadingState());

    final categoryProductOrFailure = await repository.allProducts();
    categoryProductOrFailure.fold(
            (failure)=> emit(ProductsErrorState(message: failure.message)),
            (success) {
          allProducts = success.products;
          //print('------------------------allProducts length: ${allProducts.length} ------------------');
          emit(ProductsSuccessState());
        }
    );
  }
}
