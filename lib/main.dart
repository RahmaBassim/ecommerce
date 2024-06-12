import 'package:e_commerce/shared/resources/routes_manager.dart';
import 'package:e_commerce/shared/resources/theme/theme_cubit.dart';
import 'package:e_commerce/shared/static/bloc_observer.dart';
import 'package:e_commerce/shared/static/navigation_service.dart';
import 'package:e_commerce/shared/static/routes.dart';
import 'package:e_commerce/shared/static/service_locator.dart';
import 'package:e_commerce/view/home/cubit/categories_cubit.dart';
import 'package:e_commerce/view/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/view/products/cubit/products_cubit.dart';
import 'package:e_commerce/view/user_authontication/login/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';


void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavBarCubit()),
            BlocProvider(create: (_) => sl<ProductsCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
            BlocProvider(create: (_) => sl<LoginCubit>()),
            BlocProvider(create: (_) => sl<ThemeCubit>()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeModeChangedState>(

            builder: (context, state) {
              return MaterialApp(
                title: "Shopping",
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                theme:state.userTheme,
                debugShowCheckedModeBanner: false,
                navigatorKey: sl<NavigationService>().navigatorKey,
                initialRoute: Routes.navBar,
                onGenerateRoute: RoutesManager.onGenerateRoute,
              );
            },
          ),
        );
      },
    );
  }
}

