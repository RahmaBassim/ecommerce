import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/resources/colors_manager.dart';
import '../../shared/static/routes.dart';


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
  late PageController _controller ;
  bool isLast = false;
  int currentIndex = 0;

  @override
  void initState(){
    super.initState();
    _controller = PageController(initialPage: 0);
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: PageView.builder(
              itemCount: pages.length,
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (int index){
                  if(index == pages.length -1){
                    setState(() {
                      isLast = true;
                      currentIndex = index;
                    });
                  }else {
                    setState(() {
                      isLast =false;
                      currentIndex = index;
                    });
                  }
                },
                itemBuilder: (context, index) => builderItem(pages[index])))
          ],
        ),
      ),
    );
  }

  Widget builderItem (OnBoardingDetails screen) => Column(
    children: [
      SizedBox(height: 100.h,),
      SizedBox(
        width: 450.w,
        height: 350.h,
        child: Image.asset(screen.image),
      ),
      SizedBox(height: 50.h,),
      Text(
        screen.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          screen.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              screen.skip? TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route)=>false);
                  },
                  child: Text(
                    StringsManager.skip.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  )
              ): const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                      (index) => buildDot(index, context),
                ),
              ),
              TextButton(
                  onPressed: (){
                    if(isLast == true) {
                      //Navigator.pushNamed(context, Routes.login);
                      Navigator.pushNamed(context, Routes.login);

                    }else {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Text(
                    StringsManager.next.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  )
              )
            ],
          ),
        ),
      )
    ],
  );
  Container buildDot (int index ,BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin:const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ?ColorsManager.black:ColorsManager.grey,
      ),
    );
  }
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

