// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/Core/constants/routes.dart';
import 'package:nko_flutter/View/Task/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controller/local_controllar.dart';
import 'Core/localization/translations.dart';
import 'route.dart';

SharedPreferences? shardpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shardpref = await SharedPreferences.getInstance();
  PdfInvoiceApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Localcontrollar controller = Get.put(Localcontrollar());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: controller.appThem,
      locale: controller.language,
      initialBinding: Binding_test(),
      initialRoute: shardpref!.getString('code') != null
          ? AppRout.splash
          : AppRout.onbording,
      translations: AppTranslations(),
      getPages: appgetPages,
    );
  }
}


/*
// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/View/crud/Task/edit_task.dart';
import 'package:nko_flutter/View/crud/Vacations/add_vac.dart';
import 'package:nko_flutter/View/crud/Vacations/view_vac.dart';
import 'package:nko_flutter/View/crud/home_screen.dart';
import 'package:nko_flutter/View/info/about.dart';
import 'package:nko_flutter/View/intro/intro.dart';
import 'package:nko_flutter/View/intro/login.dart';
import 'package:nko_flutter/View/intro/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/crud/Task/Home_task.dart';
import 'View/crud/Task/add_task.dart';
import 'View/info/profile.dart';
import 'utils/Locale/translations.dart';
import 'utils/Locale/local_controllar.dart';
import 'View/crud/Task/pdf.dart';

SharedPreferences? shardpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shardpref = await SharedPreferences.getInstance();
  PdfInvoiceApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Mylocalcontrollar controll = Get.put(Mylocalcontrollar());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      locale: controll.initialang,
      initialRoute: shardpref!.getString('code') != null ? '/splash' : '/intro',
      // initialRoute: '/splash',
      translations: My_Translations(),
      getPages: [
        GetPage(name: '/', page: () => Main_Screen()),
        GetPage(name: '/intro', page: () => WelcomeScreen()),
        GetPage(
            name: '/splash',
            page: () => SplashScreen(),
            binding: Binding_home_task()),
        GetPage(name: '/login', page: () => Login(), binding: Binding_login()),
        GetPage(name: '/about', page: () => About()),
        GetPage(name: '/main_screen', page: () => Main_Screen()),
        GetPage(
            name: '/settings',
            page: () => ProfileSetting(),
            binding: Binding_profile()),
        GetPage(
            name: '/home_task',
            page: () => Home_Task(),
            binding: Binding_home_task()),
        GetPage(
            name: '/add_task',
            page: () => Add_Task(),
            binding: Binding_add_task()),
        GetPage(
            name: '/edit_task',
            page: () => Edit_Task(),
            binding: Binding_edit_task()),
        GetPage(
            name: '/view_vac', page: () => View_Vac(), binding: Binding_vac()),
        GetPage(
            name: '/add_vac',
            page: () => Add_Vac(),
            binding: Binding_vac_add()),
      ],
    );
  }
}
*/