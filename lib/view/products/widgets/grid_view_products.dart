import 'package:e_commerce/view/products/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/static/reusable_components.dart';
import '../cubit/products_cubit.dart';


class GridViewProducts extends StatefulWidget {
  const GridViewProducts({super.key});

  @override
  State<GridViewProducts> createState() => _GridViewProductsState();
}

class _GridViewProductsState extends State<GridViewProducts> {
  @override
  void initState() {
    ProductsCubit.get(context).getCategoryProduct("smartphones");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
         if (state is ProductsLoadingState){
          return const CustomLoadingIndicator();
        }else if(state is ProductsSuccessState){
          return SliverGrid.builder(itemBuilder: (context, index){
            return  Padding(
              padding: const EdgeInsets.all(5.0),
              child:  ProductCart(
                image: state.categoryResponseModel.products![index].images?.first??"",
                productName: state.categoryResponseModel.products![index].title??"",
                //productDescription: state.categoryResponseModel.products![index].description??"",
                price: state.categoryResponseModel.products![index].price.toString(),
              ),
            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),);
        }return const SizedBox();
      },
    );
  }
}
