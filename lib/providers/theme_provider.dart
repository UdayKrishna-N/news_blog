import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeMode?>{
  ThemeProvider():super(ThemeMode.system);

  void changeTheme(bool isDarkModeEnabled) async {
    if(isDarkModeEnabled){
      state = ThemeMode.light;
    }else{
      state = ThemeMode.dark;
    }
  }
}