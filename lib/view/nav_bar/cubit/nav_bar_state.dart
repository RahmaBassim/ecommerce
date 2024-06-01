

abstract class NavBarState{}

class NavBarCurrentState extends NavBarState{
  final NavigationBarTabs navigationBarTabs;
  final int index;
  NavBarCurrentState({
    required this.navigationBarTabs,
    required this.index
  });
}

enum NavigationBarTabs{
  home,
  favorite,
  cart,
  search,
  setting
}