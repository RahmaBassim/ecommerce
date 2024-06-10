import 'package:e_commerce/shared/resources/assets_manager.dart';
import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:e_commerce/view/home/screen/main_home_screen.dart';
import 'package:e_commerce/view/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/resources/string_maneger.dart';
import '../favorite/screen/favorite_screen.dart';
import '../search/screen/search_screen.dart';
import '../setting/screen/setting_screen.dart';
import '../shopping_cart/screen/shopping_cart_screen.dart';
import 'cubit/nav_bar_state.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Localizations.override(
        context: context,
        locale: context.locale,
        child: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state){
            if(state is NavBarCurrentState){
              return BottomNavigationBar(
                currentIndex: state.index,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorsManager.pink,
                  unselectedItemColor: ColorsManager.grey,
                  items: [
                    _bottomNavigationBarItem(
                        icon: AssetsManager.homeIcon,
                        label: StringsManager.home.tr(),
                        currentIndex: state.index,
                        iconIndex: 0
                    ),
                    _bottomNavigationBarItem(
                        icon: AssetsManager.favoriteIcon,
                        label: StringsManager.favorite.tr(),
                        currentIndex: state.index,
                        iconIndex: 1
                    ),
                    _bottomNavigationBarItem(
                        icon: AssetsManager.cartIcon,
                        label: StringsManager.cart.tr(),
                        currentIndex: state.index,
                        iconIndex: 2
                    ),
                    _bottomNavigationBarItem(
                        icon: AssetsManager.searchIcon,
                        label: StringsManager.search.tr(),
                        currentIndex: state.index,
                        iconIndex: 3
                    ), _bottomNavigationBarItem(
                        icon: AssetsManager.settingIcon,
                        label: StringsManager.setting.tr(),
                        currentIndex: state.index,
                        iconIndex: 4
                    ),
                  ],
                onTap: (index) => changeTabs(index: index,context: context),
              );
            }else {
              return const SizedBox();
            }
          },
        ),
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state){
          if (state is NavBarCurrentState){
            if (state.navigationBarTabs == NavigationBarTabs.home){
              return const MainHomeScreen();
            }else if (state.navigationBarTabs == NavigationBarTabs.favorite){
              return const FavoriteScreen();
            }else if (state.navigationBarTabs == NavigationBarTabs.cart){
              return const ShoppingCartScreen();
            }else if (state.navigationBarTabs == NavigationBarTabs.search){
              return const SearchScreen();
            }else if (state.navigationBarTabs == NavigationBarTabs.setting){
              return const SettingScreen();
            }
          }return  Center (
            child: Text(
              StringsManager.homeScreen.tr(),
            ),
          );
        },
      ),
    );
  }
}


BottomNavigationBarItem _bottomNavigationBarItem({
  required String icon,
  required String label,
  required int currentIndex,
  required int iconIndex
}){
  return BottomNavigationBarItem(
    label: label,
    icon: Column(
      children: [
        SizedBox(height: 10.h,),
        SvgPicture.asset(
          icon,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
              navIconColor(
                iconIndex: iconIndex,
                currentIndex: currentIndex
              ),
              BlendMode.srcIn),
        )
      ],
    )
  );
}

Color navIconColor({
  required int iconIndex,
  required int currentIndex,
}) {
  return currentIndex == iconIndex
      ? ColorsManager.pink
      : ColorsManager.grey;
}

void changeTabs ({
  required int index,
  required BuildContext context
}) {
  if (index == 0){
    context.read<NavBarCubit>().getNavBarItems(NavigationBarTabs.home);
  }else if (index == 1){
    context.read<NavBarCubit>().getNavBarItems(NavigationBarTabs.favorite);
  }else if (index == 2){
    context.read<NavBarCubit>().getNavBarItems(NavigationBarTabs.cart);
  }else if (index == 3){
    context.read<NavBarCubit>().getNavBarItems(NavigationBarTabs.search);
  }else {
    context.read<NavBarCubit>().getNavBarItems(NavigationBarTabs.setting);
  }
}