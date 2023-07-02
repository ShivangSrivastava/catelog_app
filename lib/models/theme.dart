import 'package:catelog_app/core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ThemeManager {
  static int? index = 0;
  static ThemeMode getTheme() {
    return (index == 0)
        ? ThemeMode.dark
        : (index == 1)
            ? ThemeMode.light
            : ThemeMode.system;
  }
}

class ThemeMutation extends VxMutation<MyStore> {
  final int? index;

  ThemeMutation(this.index);

  @override
  perform() {
    if (index != ThemeManager.index) {
      ThemeManager.index = index;
    }
  }
}
