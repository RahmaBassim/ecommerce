part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoadingState extends ProductsState {}
class ProductsEmptyState extends ProductsState {}
class ProductsSuccessState extends ProductsState {


}
class CategoryProductsSuccessState extends ProductsState {
  final ProductsResponseModel categoryResponseModel;
  CategoryProductsSuccessState({required this.categoryResponseModel});
}
class ProductsErrorState extends ProductsState {
  final String? message;
  ProductsErrorState({this.message});
}
