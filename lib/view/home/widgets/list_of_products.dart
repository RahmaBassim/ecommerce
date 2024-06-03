import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/static/reusable_components.dart';
import '../../products/widgets/product_cart.dart';


class ListOfProducts extends StatelessWidget {
  const ListOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state){
          if (state is ProductsLoadingState){
            return const CustomLoadingIndicator();
          }else if(state is ProductsSuccessState){
            return SizedBox(
              width: 500.w,
              height: 300.h,
              child: Wrap(
                children: List.generate(
                state.categoryResponseModel.products!.length,
                 (index){
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:  ProductCart(
                      image: "assets/images/product.png",
                      productName: state.categoryResponseModel.products![index].title??"",
                      productDescription: state.categoryResponseModel.products![index].description??"",
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
/*SizedBox(
              width: 500.w,
              height: 300.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return const Padding(
                      padding:  EdgeInsets.all(5.0),
                      child:  ProductCart(
                        image: "assets/images/product.png",
                        productName: "Test Name",
                        productDescription: "Test Description",
                      ),
                    );
                  }
              ),
            )*/