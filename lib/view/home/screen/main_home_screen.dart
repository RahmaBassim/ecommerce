import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/features.dart';
import '../widgets/header.dart';


class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.light,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 30.h,),
            const HomeHeaderWidget(),
            SizedBox(height: 30.h,),
            const FeaturesWidget(),
          ],
        ),
      )
    );
  }
}
