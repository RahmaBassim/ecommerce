import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/string_maneger.dart';
import '../../../shared/static/reusable_components.dart';


class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> categoryNames =[
    StringsManager.beauty.tr(),
    StringsManager.fashion.tr(),
    StringsManager.kids.tr(),
    StringsManager.men.tr(),
    StringsManager.women.tr(),
  ];
  List<String> categoryImage = [
    AssetsManager.beauty,
    AssetsManager.fashion,
    AssetsManager.kids,
    AssetsManager.men,
    AssetsManager.women,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.w,
      height: 200.h,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Row(
              children: [
                SizedBox(width: 20.w,),
                CategoryContainer(
                  categoryName: categoryNames[index],
                  image: categoryImage[index],
                ),
              ],
            );
          }),
    );
  }
}



