import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/assets_manager.dart';
import '../../../shared/static/constants.dart';
import '../../../shared/static/reusable_components.dart';
import '../widgets/list_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTileWidget(
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
                        actions: <Widget>[
                          Column(
                            children: [
                              CustomButtonLanguage(
                                  text: StringsManager.ar.tr(),
                                  function: () {
                                    context.setLocale(
                                        const Locale(Constants.arCode));
                                   /* EditUserProfileCubit.get(context)
                                        .editUserProfile(
                                        editProfileRequestModel:
                                        EditProfileRequestModel(
                                            language:
                                            Constants
                                                .arCode));*/
                                  }),
                               SizedBox(
                                height: 24.h,
                              ),
                              CustomButtonLanguage(
                                  text: StringsManager.en.tr(),
                                  function: () {
                                    context.setLocale(
                                        const Locale(Constants.enCode));
                                    /*EditUserProfileCubit.get(context)
                                        .editUserProfile(
                                        editProfileRequestModel:
                                        EditProfileRequestModel(
                                            language:
                                            Constants
                                                .enCode));*/
                                  }),
                            ],
                          )
                        ])
                );
              }
            },
          )
        ],
      ),
    );
  }
}
