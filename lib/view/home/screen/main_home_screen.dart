
import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/string_maneger.dart';
import '../../../shared/static/reusable_components.dart';
import '../../../shared/static/routes.dart';
import '../widgets/adv.dart';
import '../widgets/categories_widget.dart';
import '../widgets/header.dart';
import '../widgets/list_of_products.dart';


class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 30.h,),
            const HomeHeaderWidget(),
            SizedBox(height: 30.h,),
            const AdvWidget(),
            SizedBox(height: 30.h,),
            const CategoryWidget(),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){
                  ProductsCubit.get(context).getAllProducts();
                    Navigator.pushNamed(context, Routes.products);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderText(
                          title: StringsManager.products.tr()
                      ),
                      const Icon(Icons.navigate_next_sharp)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            const ListOfProducts(),
            SizedBox(height: 20.h,),
            Container(
              width: 350.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:const  DecorationImage(
                  image: AssetImage("assets/images/summer.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      )
    );
  }
}
