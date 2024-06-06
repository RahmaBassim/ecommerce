import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/response/get_categories/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../repostory/repostory.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  Repository repository;
  GetCategoriesResponse? categoriesResponse;
  CategoriesCubit({required this.repository}) : super(CategoriesInitial());
  String? selectedCategory;
  static CategoriesCubit get(context)=> BlocProvider.of(context);

  getCategories() async {
    emit(CategoriesLoadingState());
    /*String token= sl<LocalDatasource>().getToken();
    if(token.isEmpty){
      emit(CategoriesEmptyState());
      return;
    }*/
    final categoryOrFailure = await repository.categories();
    categoryOrFailure.fold(
        (failure)=> emit(CategoriesErrorState(message: failure.message)),
        (success){
          categoriesResponse = success;
          selectedCategory =success.categories.isNotEmpty? success.categories.first.name:'';
          emit(CategoriesSuccessState(categoriesResponse: success,selectedCategory: selectedCategory));
        }
    );
  }
  selectCategory(String selected){
      selectedCategory = selected;
      emit(CategoriesSuccessState(categoriesResponse: categoriesResponse??GetCategoriesResponse(categories: []), selectedCategory: selectedCategory));
  }
}
