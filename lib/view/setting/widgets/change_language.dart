import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/assets_manager.dart';
import '../../../shared/resources/string_maneger.dart';
import '../../../shared/static/constants.dart';
import '../../../shared/static/reusable_components.dart';
import 'list_tile_widget.dart';


class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return ListTileWidget(
      image: AssetsManager.languageIcon,
      title: StringsManager.changeLanguage.tr(),
      onPressed: (){
        {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  title: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AssetsManager.closeIcon,
                        alignment: Alignment.topRight,
                      )),
                  actions: [
                    Column(
                      children: [
                        CustomButtonLanguage(
                            text: StringsManager.ar.tr(),
                            function: () {
                              context.setLocale(
                                  const Locale(Constants.arCode));
setState(() {

});
                            }),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButtonLanguage(
                            text: StringsManager.en.tr(),
                            function: () {
                              context.setLocale(
                                  const Locale(Constants.enCode));
                              setState(() {

                              });
                            }),
                      ],
                    )
                  ])
          );
        }
      },
    );
  }
}
