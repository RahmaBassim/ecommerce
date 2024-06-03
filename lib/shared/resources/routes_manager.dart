

import 'package:e_commerce/shared/static/routes.dart';
import 'package:e_commerce/view/on_boarding/on_boarding_screen.dart';
import 'package:e_commerce/view/products/screen/products_screen.dart';
import 'package:e_commerce/view/user_authontication/forget_password/screen/forget_password_screen.dart';
import 'package:e_commerce/view/user_authontication/signup/screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../view/custom_home/screen/custom_home_screen.dart';
import '../../view/home/screen/main_home_screen.dart';
import '../../view/nav_bar/nav_bar.dart';
import '../../view/user_authontication/login/screen/login_screen.dart';

class RoutesManager{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.onBoarding:
        return CupertinoPageRoute(
            builder: (_) =>
                const OnBoardingScreen(), settings: routeSettings
        );
      case Routes.login:
        return CupertinoPageRoute(
            builder: (_)=> const LoginScreen(), settings: routeSettings);
      case Routes.forgetPassword:
        return CupertinoPageRoute(
            builder:(_)=> const ForgetPasswordScreen(), settings: routeSettings);
      case Routes.customHome:
        return CupertinoPageRoute(
            builder: (_)=> const CustomHomeScreen(), settings: routeSettings);
      case Routes.signUp:
        return CupertinoPageRoute(
            builder:(_)=> const SignupScreen(), settings: routeSettings );
      case Routes.mainHome:
        return CupertinoPageRoute(
            builder:(_)=> const MainHomeScreen(), settings: routeSettings );
      case Routes.navBar:
        return CupertinoPageRoute(
            builder:(_)=> const NavBar(), settings: routeSettings );
      case Routes.products:
        return CupertinoPageRoute(
            builder:(_)=> const ProductsScreen(), settings: routeSettings );
    }
  }
}