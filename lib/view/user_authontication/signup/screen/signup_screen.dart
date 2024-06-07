import 'package:e_commerce/models/response/signup_response/signup_response.dart';
import 'package:e_commerce/view/user_authontication/signup/cubit/signup_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/colors_manager.dart';
import '../../../../shared/resources/string_maneger.dart';
import '../../../../shared/static/navigation_service.dart';
import '../../../../shared/static/reusable_components.dart';
import '../../../../shared/static/routes.dart';
import '../../../../shared/static/service_locator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140.h,
                  ),
                  HeaderText(
                    title: StringsManager.createAccount.tr(),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  CustomTextFormField(
                    validate: CustomValidation.validateEmail,
                    keyboardType: TextInputType.text,
                    textEditingController: mailController,
                    hintText: StringsManager.enterMail.tr(),
                    prefix: Icons.mail,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  PasswordField(
                    hintText: StringsManager.enterPassword.tr(),
                    controller: passwordController,
                    label: StringsManager.enterValidPassword.tr(),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringsManager.requiredData.tr();
                      }  else if (value.length < 6) {
                        return StringsManager.passwordValidate.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  PasswordField(
                    hintText: StringsManager.confirmPassword.tr(),
                    controller: confirmPasswordController,
                    label: StringsManager.validateConfirmPass.tr(),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringsManager.requiredData.tr();
                      } else if (value != passwordController.text) {
                        return StringsManager.unmatchedPass.tr();
                      } else if (value.length < 6) {
                        return StringsManager.passwordValidate.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is SignupSuccessState) {
                        sl<NavigationService>().navigateTo(Routes.login);
                      } else if (state is SignupErrorState) {
                        showToast(state.message ?? '');
                      }
                    },
                    builder: (context, state) {
                      if (state is SignupLoadingState) {
                        return const CustomLoadingIndicator();
                      } else {
                        return CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await SignupCubit.get(context).signUp(
                                  signup: UserModel(
                                password: passwordController.text,
                                phone: '12312123',
                                email: mailController.text,
                                fullName: FullName(
                                  firstName: 'fullName.text',
                                  lastName: '',
                                ),
                              ));
                            }
                          },
                          title: StringsManager.signUp.tr(),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.haveAccount.tr(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: Text(
                          StringsManager.login.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: ColorsManager.pink),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
