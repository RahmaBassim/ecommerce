import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:e_commerce/shared/resources/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../static/service_locator.dart';


class ThemeCubit extends Cubit<ThemeModeChangedState> {
  ThemeCubit() : super(ThemeModeChangedState(userTheme: MyTheme.lightTheme));
  bool _isDark = false;

  bool get isDark => _isDark;

  static ThemeCubit get(context) => BlocProvider.of(context);
  String currentTheme = 'light';

  void getSavedTheme() {
    final response = sl<LocalDatasource>().getTheme();
    currentTheme = response ?? '';
    _checkTheme(currentTheme);
  }

  Future<void> _changeTheme(String theme) async {

    await sl<LocalDatasource>().setData(key:'theme', value: theme);
    currentTheme = theme;
    _checkTheme(theme);
  }
  toggleTheme(){
    if(isDark){
      toLightMode();
    }else{
      toDarkMode();
    }

  }
  void toDarkMode() => _changeTheme('dark');

  void toLightMode() => _changeTheme('light');

  _checkTheme(String theme) {
    if (theme == 'dark') {
      _isDark = true;
      emit(ThemeModeChangedState(userTheme: MyTheme.darkTheme));

    } else {

      _isDark = false;
      emit(ThemeModeChangedState(userTheme: MyTheme.lightTheme));
    }
  }
}

class ThemeModeChangedState {
  final ThemeData userTheme;

  const ThemeModeChangedState({required this.userTheme});

  ThemeModeChangedState copyWith({
    ThemeData? userTheme,
  }) {
    return ThemeModeChangedState(
      userTheme: userTheme ?? this.userTheme,
    );
  }

  List<Object?> get props => [userTheme];
}
