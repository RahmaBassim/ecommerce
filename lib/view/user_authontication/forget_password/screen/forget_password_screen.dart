import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/string_maneger.dart';
import '../../../../shared/static/reusable_components.dart';
import '../../../../shared/static/routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 140.h,),
              HeaderText(title: StringsManager.forgetPassword.tr(),),
              SizedBox(height: 80.h,),
              CustomTextFormField(
                validate: CustomValidation.validateEmail,
                keyboardType: TextInputType.text,
                textEditingController: mailController,
                hintText: StringsManager.enterMail.tr(),
                prefix: Icons.mail,
              ),
              SizedBox(height: 30.h,),
              Text(
                StringsManager.mailSent.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 100.h,),
              CustomButton(
                onTap: (){
                  Navigator.pushNamed(context, Routes.login);
                },
                title: StringsManager.submit.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
