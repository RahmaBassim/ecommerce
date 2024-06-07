import 'package:e_commerce/models/response/get_category_products/get_catedory_products_model.dart';
import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
ProductsCubit.get(context).getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) { 
    return BlocBuilder<ProductsCubit, ProductsState>(

        builder: (context, state){

         if(ProductsCubit.get(context).allProducts.isNotEmpty){
            List<ProductModel> allProducts = ProductsCubit.get(context).allProducts;
            return SizedBox(
              width: 500.w,
              height: 330.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    allProducts.length >=15 ? 15:allProducts.length,
                 (index){
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:  ProductCart(
                      image: allProducts[index].images?.first??"",
                      productName: allProducts[index].title??"",
                      price: allProducts[index].price.toString(),
                    ),
                  );
                 }),
              ),
            );
          }
         else if (state is ProductsLoadingState){
            return const CustomLoadingIndicator();
          }
            return const SizedBox();
        }
        );
  }
}