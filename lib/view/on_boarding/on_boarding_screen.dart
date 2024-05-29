import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingDetails> pages =[
    OnBoardingDetails(
        title: StringsManager.onBoarding1.tr(),
        image: AssetsManager.onBoardingF,
        description: StringsManager.onBoardingDes1.tr(),
        skip: true,
    ),
    OnBoardingDetails(
      title: StringsManager.onBoarding2.tr(),
      image: AssetsManager.onBoardingS,
      description: StringsManager.onBoardingDes2.tr(),
      skip: true,
    ),
    OnBoardingDetails(
      title: StringsManager.onBoarding3.tr(),
      image: AssetsManager.onBoardingT,
      description: StringsManager.onBoardingDes3.tr(),
      skip: false,
    )
  ];
  final controller = PageController();
  bool isList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: PageView.builder(
              itemCount: pages.length,
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (int index){
                if (index == pages.length -1){
                  setState(() {
                    isList = true;
                  });
                }else {
                  setState(() {
                    isList = false;
                  });
                }
                },
                itemBuilder: (context, index) => builderItem(pages[index])))
          ],
        ),
      ),
    );
  }

  Widget builderItem (OnBoardingDetails screen) => SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          width: 300.w,
          height: 300.h,
          child: Image.asset(screen.image),
        ),
        Text(
          screen.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          screen.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    ),
  );
}


class OnBoardingDetails{
  final String image;
  final String title;
  final String description;
  final bool skip;

  OnBoardingDetails({
    required this.title,
    required this.image,
    required this.description,
    required this.skip
  });
}