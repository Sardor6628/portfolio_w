import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/services/storage/theme_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(ThemeMode initialTheme) : super(initialTheme);

  void toggleThemeMode() {
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(newTheme);
    ThemeStorage.saveThemeMode(newTheme);
  }
  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    ThemeStorage.saveThemeMode(themeMode);
  }
}