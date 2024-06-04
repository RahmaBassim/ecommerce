part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoadingState extends CategoriesState {}
class CategoriesEmptyState extends CategoriesState {}
class CategoriesSuccessState extends CategoriesState {
  final GetCategoriesResponse categoriesResponse;
  CategoriesSuccessState({required this.categoriesResponse});
}
class CategoriesErrorState extends CategoriesState {
  final String? message;
  CategoriesErrorState({this.message});
}
