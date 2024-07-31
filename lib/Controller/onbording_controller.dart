import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/routes.dart';
import 'package:nko_flutter/Data/datasource/static/static.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class ONBordingControllerImp extends OnBordingController {
  late PageController pagecontroller;
  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      Get.offAllNamed(
        AppRout.login,
      );
    } else {
      pagecontroller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
