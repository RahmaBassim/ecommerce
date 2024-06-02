import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 130.w,
            height: 60.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.logo),
                fit: BoxFit.fill
              )
            ),
          ),
          CircleAvatar(
            child: Image.asset(
                AssetsManager.user,
              fit: BoxFit.cover,
            ),

          )
        ],
      ),
    );
  }
}
