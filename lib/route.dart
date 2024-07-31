import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/routes.dart';
import 'package:nko_flutter/View/Screen/onbording.dart';
import 'package:nko_flutter/View/Screen/home_screen.dart';
import 'package:nko_flutter/View/Task/Home_task.dart';
import 'package:nko_flutter/View/info/about.dart';
import 'package:nko_flutter/View/info/profile.dart';
import 'package:nko_flutter/View/Screen/login.dart';
import 'package:nko_flutter/View/Screen/splash.dart';

List<GetPage<dynamic>>? appgetPages = [
  GetPage(name: AppRout.mainScreen, page: () => Main_Screen()),
  GetPage(name: AppRout.login, page: () => Login()),
  GetPage(name: AppRout.about, page: () => About()),
  GetPage(name: AppRout.profileSetting, page: () => ProfileSetting()),
  GetPage(name: AppRout.homeTask, page: () => const HomeTask()),
  GetPage(name: AppRout.splash, page: () => SplashScreen()),
  GetPage(name: AppRout.onbording, page: () => const OnBording())
];

// Map<String, Widget Function(BuildContext)> approutes = {
//   AppRout.login: (context) => Login(),
//   AppRout.homeTask: (context) => Home_Task(),
//   AppRout.mainScreen: (context) => Main_Screen(),
//   AppRout.onbording: (context) => const OnBording(),
//   AppRout.splash: (context) => SplashScreen(),
//   AppRout.about: (context) => About(),
//   AppRout.profileSetting: (context) => ProfileSetting(),
// };
