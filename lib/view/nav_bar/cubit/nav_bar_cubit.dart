import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_bar_state.dart';


class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarCurrentState(
    navigationBarTabs: NavigationBarTabs.home,
    index: 0
  ));
  static NavBarCubit get(context) => BlocProvider.of(context);

  void getNavBarItems (NavigationBarTabs tabs){
    switch(tabs){
      case NavigationBarTabs.home:
        emit(NavBarCurrentState(
            navigationBarTabs: NavigationBarTabs.home,
            index: 0));
        break;
      case NavigationBarTabs.favorite:
        emit(NavBarCurrentState(
            navigationBarTabs: NavigationBarTabs.favorite,
            index: 1));
        break;
      case NavigationBarTabs.cart:
        emit(NavBarCurrentState(
            navigationBarTabs: NavigationBarTabs.cart,
            index: 2));
        break;
      case NavigationBarTabs.search:
        emit(NavBarCurrentState(
            navigationBarTabs: NavigationBarTabs.search,
            index: 3));
        break;
      case NavigationBarTabs.setting:
        emit(NavBarCurrentState(
            navigationBarTabs: NavigationBarTabs.setting,
            index: 4));
        break;
    }
  }
}
