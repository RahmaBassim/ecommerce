import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:e_commerce/shared/resources/theme/theme_cubit.dart';
import 'package:e_commerce/view/products/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/response/get_category_products/get_catedory_products_model.dart';


class ProductCart extends StatelessWidget {
  final ProductModel product;
  const ProductCart({
    required this.product,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      // height: 330.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ThemeCubit.get(context).isDark ? ColorsManager.softPink : ColorsManager.white,
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
                image: NetworkImage(product.images?.first??''),
                fit: BoxFit.contain
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              product.title??'',
              style: Theme.of(context).textTheme.displaySmall
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              product.price.toString(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          SizedBox(height: 15.h,),
          RateWidget(rate: product.rate!.toDouble(),)
        ],
      ),
    );
  }
}
