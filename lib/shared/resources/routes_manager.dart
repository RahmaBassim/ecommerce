

import 'package:e_commerce/shared/static/routes.dart';
import 'package:e_commerce/view/on_boarding/on_boarding_screen.dart';
import 'package:flutter/cupertino.dart';

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
    }
  }
}