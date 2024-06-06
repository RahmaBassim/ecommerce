import 'package:e_commerce/models/request/login_request/login_request.dart';
import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:e_commerce/shared/static/navigation_service.dart';
import 'package:e_commerce/view/user_authontication/login/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/static/reusable_components.dart';
import '../../../../shared/static/routes.dart';
import '../../../../shared/static/service_locator.dart';


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
                SizedBox(height: 140.h,),
                HeaderText(title: StringsManager.headerTitle.tr(),),
                SizedBox(height: 100.h,),
                CustomTextFormField(
                    validate: CustomValidation.validateName,
                    keyboardType: TextInputType.text,
                    textEditingController: mailController,
                    hintText: StringsManager.enterMail.tr(),
                  prefix: Icons.person,
                ),
                SizedBox(height: 50.h,),
                PasswordField(
                  hintText: StringsManager.enterPassword.tr(),
                  controller: passwordController,
                  label: StringsManager.enterValidPassword.tr(),
                  onChanged: (value){},
                  validator: (value){
                    if(value!.isEmpty){
                      return StringsManager.requiredData.tr();
                    } else if (value != passwordController.text){
                      return StringsManager.unmatchedPass.tr();
                    }else if(value.length < 6){
                      return StringsManager.passwordValidate.tr();
                    }else {
                      return null;
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.forgetPassword);
                      },
                      child: Text(
                        StringsManager.forgetPassword.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      )),
                ),
                SizedBox(height: 100.h,),
                BlocConsumer<LoginCubit, LoginState>(
                  listenWhen: (previous, current) => current is LoginSuccessState || current is LoginErrorState,
                  listener: (context, state) {
                    if(state is LoginSuccessState){
                      sl<NavigationService>().navigateTo(Routes.mainHome);
                    }else if(state is LoginErrorState){
                      showToast(state.error);
                    }

                  },
  builder: (context, state) {
                    if(state is LoginLoading){
                      return const Center(child:  CircularProgressIndicator());
                    }else{
                      return CustomButton(
                        onTap: (){
                          if(formKey.currentState!.validate()){
                            LoginCubit.get(context).login(request: LoginRequestModel(
                              password: passwordController.text,
                              email: mailController.text,
                            ));
                          }


                        },
                        title: StringsManager.login.tr(),
                      );
                    }


  },
),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.createAccount.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      child: Text(
                        StringsManager.signUp.tr(),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorsManager.pink),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
