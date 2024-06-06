import 'package:e_commerce/view/home/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/response/get_category_products/get_catedory_products_model.dart';
import '../../../shared/static/reusable_components.dart';
import '../../home/widgets/features.dart';
import '../../home/widgets/header.dart';
import '../cubit/products_cubit.dart';
import '../widgets/grid_view_products.dart';
import '../widgets/product_cart.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
   /* final state = CategoriesCubit.get(context).state;
    if(state is CategoriesSuccessState){
      ProductsCubit.get(context).getCategoryProduct(state.selectedCategory??'');
    }*/
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                HomeHeaderWidget(),
                FeaturesWidget(),
              ],
            ),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(

            builder: (context, state) {

              if(ProductsCubit.get(context).categoryProducts.isNotEmpty && ProductsCubit.get(context).category!=null){
                List<ProductModel> categoryProduct = ProductsCubit.get(context).categoryProducts;
                return SliverGrid.builder(
                  itemCount:categoryProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ProductCart(
                        image: categoryProduct[index]
                            .images?.first ??
                            "",
                        productName: categoryProduct[index].title ??
                            "",
                        //productDescription: state.categoryResponseModel![index].description??"",
                        price: categoryProduct[index].price
                            .toString(),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                );
              }
              else if(ProductsCubit.get(context).categoryProducts.isEmpty && ProductsCubit.get(context).category!=null){


              }
              else if (state is ProductsLoadingState) {
                return const SliverToBoxAdapter(
                    child: CustomLoadingIndicator());
              }
              else if (ProductsCubit.get(context).allProducts.isNotEmpty) {
                List<ProductModel> allProducts = ProductsCubit.get(context).allProducts;
                return SliverGrid.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ProductCart(
                        image: allProducts[index]
                            .images?.first ??
                            "",
                        productName: allProducts[index].title ??
                            "",
                        //productDescription: state.categoryResponseModel![index].description??"",
                        price: allProducts[index].price
                            .toString(),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                );
              }

              return const SliverToBoxAdapter(child: SizedBox());
            },
          )
        ],
      ),
    );
  }
}
