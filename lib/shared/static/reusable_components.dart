import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:e_commerce/shared/resources/string_maneger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';


class HeaderText extends StatelessWidget {
  final String title;
  const HeaderText({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validate;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final void Function()? suffixPressed;
  final bool obscurePassword;
  final TextInputAction? inputAction;
  final String? hintText;
  final IconData? suffix;
  final IconData? prefix;

   const CustomTextFormField({
    required this.validate,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
    this.inputAction,
    this.obscurePassword = false,
    this.suffixPressed,
    this.suffix,
    this.prefix,
    super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:const TextStyle(color: ColorsManager.black,fontSize: 10),
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      controller: widget.textEditingController,
      obscureText: widget.obscurePassword,
      decoration: InputDecoration(
        prefixIcon: widget.prefix != null?
        Icon(widget.prefix):null,
        suffixIcon: widget.suffix != null ?
            IconButton(
                onPressed: widget.suffixPressed,
                icon: Icon(widget.suffix))
            : null,
        contentPadding: REdgeInsets.symmetric(
          horizontal: 30
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: ColorsManager.grey
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.w,
              color: ColorsManager.grey
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.w,
              color: ColorsManager.red
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        errorStyle: const TextStyle(fontSize: 12),
        fillColor: ColorsManager.softGrey,
        filled: true,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}

class CustomValidation {
  static String password = '';
  static String email = "test@test1.com";

  static String? validatePassword(String? value) {
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])');

    //r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    if (value?.isEmpty==true) {
      return StringsManager.requiredData.tr();
    } else if (value!.length < 6) {
      return StringsManager.passwordValidate.tr();
    } else {
      if (!regex.hasMatch(value)) {
        return StringsManager.enterValidPassword.tr();
      } else {
        return null;
      }
    }
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value!.isEmpty) {
      return StringsManager.requiredData.tr();
    } else if (value.length < 6) {
      return StringsManager.passwordValidate.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    return value == null || value.isEmpty ? StringsManager.requiredData.tr() : null;
  }

  static String? validateEmail(String? value) {


    if (value!.isEmpty) {
      return StringsManager.requiredData.tr();
    } else {
      if (isEmail(value)==false) {
        return StringsManager.validMail.tr();
      } else {
        return null;
      }
    }
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
   const PasswordField({
    required this.controller,
    required this.hintText,
    this.label,
    this.onChanged,
    this.validator,
    super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}
class _PasswordFieldState extends State<PasswordField> {
  late bool passwordVis;
  @override
  void initState(){
    passwordVis = true;
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validate: widget.validator ?? CustomValidation.validatePassword,
      keyboardType: TextInputType.visiblePassword,
      textEditingController: widget.controller,
      hintText: StringsManager.enterPassword.tr(),
      suffixPressed: (){
        setState(() {
          passwordVis = !passwordVis;
        });
      },
      prefix: Icons.lock,
      suffix: passwordVis ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
      obscurePassword: passwordVis,
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const CustomButton({
    required this.title,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: 317.w,
        height: 55.h,
        decoration: BoxDecoration(
          color: ColorsManager.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class SortContainer extends StatelessWidget {
  final String text;
  final String icon;
  const SortContainer({required this.text,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 55.w,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsManager.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SvgPicture.asset(icon)
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  final dynamic icon;
  final String categoryName;
  const CategoryContainer({required this.icon,required this.categoryName,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: ColorsManager.softPink,size: 25,),
        Text(
          categoryName,
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }
}

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class CustomButtonLanguage extends StatelessWidget {
  final String text;
  final bool? isBlack;
  final dynamic function;

  const CustomButtonLanguage({
    super.key,
    required this.text,
    required this.function,
    this.isBlack=false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorsManager.softPink
              //ThemeCubit.get(context).isDark? const Color(0xFF3D4C5D): const Color(0xFFAF914E)
          ),
          height: 48.h,
          width: 135.w,
          child: Center(
              child: Text(
                  text,
                  style:Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white
                  )
              )),
        ),
      ),
    );
  }
}


void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsManager.softPink,
      textColor:ColorsManager.black,
      fontSize: 10.sp);
}




