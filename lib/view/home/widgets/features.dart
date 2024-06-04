import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/assets_manager.dart';
import '../../../shared/resources/string_maneger.dart';
import '../../../shared/static/reusable_components.dart';
import 'categories_widget.dart';


class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(
                  title: StringsManager.features.tr()
              ),
              Row(
                children: [
                  SortContainer(
                    text: StringsManager.sort.tr(),
                    icon: AssetsManager.sortIcon,
                  ),
                  SortContainer(
                    text: StringsManager.filter.tr(),
                    icon: AssetsManager.filterIcon,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        const CategoryWidget(),
      ],
    );
  }
}


