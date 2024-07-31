// ignore_for_file: file_names, non_constant_identifier_names, unrelated_type_equality_checks, unnecessary_null_comparison, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/class/crud.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/View/Task/Home_task.dart';

class AddEmploye extends GetxController {
  GlobalKey<FormState> formkey_add = GlobalKey<FormState>();
  TextEditingController? controllercode;
  TextEditingController? controllerName;
  TextEditingController? controllerDepart;
  TextEditingController? controllerPosition;
  TextEditingController? controllerPassword;

  Crud crud = Crud();
  RxBool allFieldsFilled = false.obs;

  onclick_ok() async {
    if (allFieldsFilled.value == true) {
      final form = formkey_add.currentState!;
      bool isValid = form.validate();
      if (isValid) {
        add_task();
        controllerName!.clear();
        controllercode!.clear();
        controllerDepart!.clear();
        controllerPosition!.clear();
        controllerPassword!.clear();
        Get.off(() => const HomeTask());
      }
    } else {
      Get.off(() => const HomeTask());
    }
  }

  add_task() async {
    var respose = await crud.postData(linkAdd, {});
    return respose;
  }

  void initUser() {
    controllercode = TextEditingController();
    controllerName = TextEditingController();
    controllerDepart = TextEditingController();
    controllerPassword = TextEditingController();
    controllerPosition = TextEditingController();
    controllerName!.addListener(checkFields);
    controllercode!.addListener(checkFields);
    controllerDepart!.addListener(checkFields);
    controllerPassword!.addListener(checkFields);
    controllerPosition!.addListener(checkFields);
  }

  void checkFields() {
    allFieldsFilled.value = controllercode!.text.isNotEmpty &&
        controllercode!.text.isNotEmpty &&
        controllerName!.text.isNotEmpty &&
        controllerDepart!.text.isNotEmpty &&
        controllerPassword!.text.isNotEmpty &&
        controllerPosition!.text.isNotEmpty;
  }

//////////////////////////////////////////////

  @override
  void onInit() {
    initUser();
    super.onInit();
  }
}
