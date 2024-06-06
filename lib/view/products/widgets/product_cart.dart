import 'package:e_commerce/models/response/get_category_products/get_catedory_products_model.dart';
import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCart extends StatelessWidget {
  final String image;
  final String productName;
  //final String productDescription;
  final String price;
  // final ProductModel product;
  const ProductCart({
    required this.productName,
    //required this.productDescription,
    required this.image,
    required this.price,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      // height: 330.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsManager.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.contain
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              productName,
              style: Theme.of(context).textTheme.displaySmall
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              price,
              style: Theme.of(context).textTheme.displaySmall,
            ),
         /* Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              productDescription,
              style: Theme.of(context).textTheme.displaySmall,
            ),*/
          ),
        ],
      ),
    );
  }
}
