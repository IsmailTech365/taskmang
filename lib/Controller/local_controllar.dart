// ignore_for_file: camel_case_types, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/them.dart';
import '../main.dart';

class Localcontrollar extends GetxController {
  Locale? language;
  ThemeData appThem = themEnglish;
  void changelang(String codelang) {
    Locale local = Locale(codelang);
    shardpref!.setString('lang', codelang);
    appThem = codelang == 'ar' ? themArabic : themEnglish;
    Get.changeTheme(appThem);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    String? shared = shardpref!.getString('lang');
    if (shared == 'ar') {
      language = const Locale('ar');
      appThem = themArabic;
    } else if (shared == 'en') {
      language = const Locale('en');
      appThem = themEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
