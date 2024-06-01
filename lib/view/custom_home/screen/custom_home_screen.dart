import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:e_commerce/shared/static/reusable_components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/string_maneger.dart';
import '../../../shared/static/routes.dart';

class CustomHomeScreen extends StatelessWidget {
  const CustomHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.customHome,),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringsManager.customHomeTitle1.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                StringsManager.customHomeTitle2.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20.h,),
              CustomButton(
                  title: StringsManager.getStart.tr() ,
                  onTap: (){
                    Navigator.pushNamed(context, Routes.navBar);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
