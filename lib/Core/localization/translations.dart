// ignore_for_file: camel_case_types

import 'package:get/get.dart';

class AppTranslations implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          '0': 'الصفحة الرئيسية',
          '1': 'الصفحة الاولى',
          '2': 'الصفحة الثانية',
          '3': 'الصفحة الثالثة',
          '4': 'حول التطبيق',
          '5': 'الإعدادت',
          '6': 'إضافة مهمة',
          '7': 'جميع المناطق',
          '8': 'المهام',
        },
        'en': {
          '0': 'Home Page',
          '1': 'One Page',
          '2': 'Two page',
          '3': 'Three page',
          '4': 'About',
          '5': 'Settings',
          '6': 'Add Task',
          '7': 'All Sub District',
          '8': 'Tasks',
        },
      };
}
