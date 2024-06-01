import 'package:e_commerce/shared/resources/routes_manager.dart';
import 'package:e_commerce/shared/resources/theme.dart';
import 'package:e_commerce/shared/static/bloc_observer.dart';
import 'package:e_commerce/shared/static/navigation_service.dart';
import 'package:e_commerce/shared/static/routes.dart';
import 'package:e_commerce/shared/static/service_locator.dart';
import 'package:e_commerce/view/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  Bloc.observer= MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translation',
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('en'),
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1034),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> NavBarCubit()),
          ],
          child: MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: MyTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: sl<NavigationService>().navigatorKey,
            initialRoute: Routes.onBoarding,
            onGenerateRoute: RoutesManager.onGenerateRoute,
          ),
        );
      },
    );
  }
}

