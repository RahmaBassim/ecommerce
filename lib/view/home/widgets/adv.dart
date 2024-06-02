import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdvWidget extends StatefulWidget {
  const AdvWidget({super.key});

  @override
  State<AdvWidget> createState() => _AdvWidgetState();
}

class _AdvWidgetState extends State<AdvWidget> {
  int activeIndex = 0;
  final controller = CarouselController();
  final images =[
    AssetsManager.adv,
    AssetsManager.adv,
    AssetsManager.adv,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            itemBuilder:(context, index, realIndex) {
              final urlImage = images[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              autoPlayAnimationDuration:const Duration(seconds: 2),
              onPageChanged: (index, state)=>
                  setState(() => activeIndex = index),
            )
        ),
        SizedBox(height: 12.h,),
        buildIndicator()
      ],
    );
  }
  Widget buildIndicator()=> AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      effect: ExpandingDotsEffect(
          dotWidth: 15.w,
        activeDotColor: ColorsManager.softPink
      ),
      activeIndex: activeIndex,
      count: images.length,
  );
  void animateToSlide(int index) => controller.animateToPage(index);
  Widget buildImage(String image, int index) =>
      SizedBox(
        child: Image.asset(image, fit: BoxFit.cover,),
      );
}
