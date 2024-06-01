import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/static/reusable_components.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? validatePassword(String? value){
    if (value!.isEmpty){
      return StringsManager.requiredData;
    }else if (value.length < 6){
      return StringsManager.passwordValidate.tr();
    } else {
      return null;
    }
  }

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h,),
                HeaderText(title: StringsManager.headerTitle.tr(),),
                SizedBox(height: 100.h,),
                CustomTextFormField(
                    validate: CustomValidation.validateEmail,
                    keyboardType: TextInputType.text,
                    textEditingController: mailController,
                    hintText: StringsManager.enterMail.tr(),
                  prefix: Icons.mail,
                ),
                SizedBox(height: 50.h,),
                CustomTextFormField(
                    validate: validatePassword,
                    keyboardType: TextInputType.text,
                    textEditingController: passwordController,
                    hintText: StringsManager.enterPassword.tr(),
                  prefix: Icons.lock,
                  suffix: Icons.remove_red_eye_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
