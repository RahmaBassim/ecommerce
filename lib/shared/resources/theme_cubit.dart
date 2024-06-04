/*
import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/local/local_datasource.dart';
import 'package:e_commerce/shared/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../static/service_locator.dart';

class ThemeCubit extends Cubit<ThemeModeChanged> {
  ThemeCubit() : super(ThemeModeChanged(userTheme: MyTheme.lightTheme));
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
    final response =
    await sl<LocalDatasource>().setData(key:'theme', value: theme);
    currentTheme = theme;
    _checkTheme(theme);
  }

  void toDarkMode() => _changeTheme('dark');

  void toLightMode() => _changeTheme('light');

  _checkTheme(String theme) {
    if (currentTheme == 'dark') {
      _isDark = true;
      emit(ThemeModeChanged(userTheme: MyTheme.darkTheme));

    } else {

      _isDark = false;
      emit(ThemeModeChanged(userTheme: MyTheme.lightTheme));
    }
  }
}

class ThemeModeChanged {
  final ThemeData userTheme;

  const ThemeModeChanged({required this.userTheme});

  ThemeModeChanged copyWith({
    ThemeData? userTheme,
  }) {
    return ThemeModeChanged(
      userTheme: userTheme ?? this.userTheme,
    );
  }

  List<Object?> get props => [userTheme];
}*/
