import 'package:e_commerce/view/home/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final state = CategoriesCubit.get(context).state;
    if(state is CategoriesSuccessState){
      ProductsCubit.get(context).getCategoryProduct(state.selectedCategory??'');
    }
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
          BlocListener<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
              // if(state is CategoriesSuccessState && state.selectedCategory?.isNotEmpty==true){
              //   ProductsCubit.get(context).getCategoryProduct(state.selectedCategory??'');
              // }
            },
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  return const SliverToBoxAdapter(
                      child: CustomLoadingIndicator());
                } else if (state is ProductsSuccessState) {
                  return SliverGrid.builder(
                    itemCount: state.categoryResponseModel.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ProductCart(
                          image: state.categoryResponseModel.products[index]
                              .images?.first ??
                              "",
                          productName: state
                              .categoryResponseModel.products![index].title ??
                              "",
                          //productDescription: state.categoryResponseModel.products![index].description??"",
                          price: state
                              .categoryResponseModel.products![index].price
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
            ),
          )
        ],
      ),
    );
  }
}
