import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'appsetting_state.dart';

class AppsettingCubit extends Cubit<AppsettingState> {
  String languageCode = 'en';
  ThemeMode appTheme = ThemeMode.dark;
  SharedPreferences? prefs;
  AppsettingCubit() : super(AppsettingInitial());
  void changeLanguage(String language) {
    emit(AppsettingInitial());
    languageCode = language;
    saveLanguage(language);
    emit(AppsettingChangeLanguage());
  }

  void changeTheme(ThemeMode newTheme) {
    emit(AppsettingInitial());
    appTheme = newTheme;
    savingTheme(newTheme);
    emit(AppsettingChangeTheme());
  }

  void savingTheme(ThemeMode themeMode) async {
    String theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs!.setString('theme', theme);
  }

  String? getTheme() {
    return prefs!.getString('theme');
  }

  Future<void> cashTheme() async {
    prefs = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      appTheme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> saveLanguage(String lang) async {
    String language = lang == 'en' ? 'en' : 'ar';
    await prefs!.setString('language', language);
  }

  Future<void> cashLanguage() async {
    prefs = await SharedPreferences.getInstance();
    String? oldLanguage = getLanguage();
    if (oldLanguage != null) {
      languageCode = oldLanguage == 'en' ? 'en' : 'ar';
    }
  }

  String? getLanguage() {
    return prefs!.getString('language');
  }
}
