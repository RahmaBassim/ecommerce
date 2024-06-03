import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCart extends StatelessWidget {
  final String image;
  final String productName;
  final String productDescription;

  const ProductCart({
    required this.productName,
    required this.productDescription,
    required this.image,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 305.h,
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
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              productName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              productDescription,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
