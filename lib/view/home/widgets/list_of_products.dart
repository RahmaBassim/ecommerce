import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/assets_manager.dart';
import '../../../shared/static/reusable_components.dart';
import '../../products/widgets/product_cart.dart';


class ListOfProducts extends StatefulWidget {
  const ListOfProducts({super.key});

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  @override
  void initState() {
    ProductsCubit.get(context).getCategoryProduct("smartphones");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state){
          print('state $state');
          if (state is ProductsLoadingState){
            return const CustomLoadingIndicator();
          }else if(state is ProductsSuccessState){
            return SizedBox(
              width: 500.w,
              height: 300.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                state.categoryResponseModel.products!.length >=5 ? 5:state.categoryResponseModel.products!.length,
                 (index){
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:  ProductCart(
                      image: state.categoryResponseModel.products![index].images?.first??"",
                      productName: state.categoryResponseModel.products![index].title??"",
                      //productDescription: state.categoryResponseModel.products![index].description??"",
                      price: state.categoryResponseModel.products![index].price.toString()??"",
                    ),
                  );
                 }),
              ),
            );
          }return const SizedBox();
        }
        );
  }
}