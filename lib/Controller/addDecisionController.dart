// ignore_for_file: camel_case_types, unused_field, prefer_final_fields, prefer_typing_uninitialized_variables, unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, unnecessary_null_comparison, depend_on_referenced_packages, unrelated_type_equality_checks, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/class/crud_old.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import 'package:intl/intl.dart';
import 'package:nko_flutter/View/Decisions/DecisionView.dart';

class Decisionaddcontroller extends GetxController {
  GlobalKey<FormState> formkey_add = GlobalKey<FormState>();
  TextEditingController? controllerNumber;
  TextEditingController? controllerDate;
  TextEditingController? controllerTitle;
  DateTime date = DateTime.now();
  Crud crud = Crud();
  RxBool allFieldsFilled = false.obs;

  onclick_ok() async {
    if (allFieldsFilled.value == true) {
      final form = formkey_add.currentState!;
      bool isValid = form.validate();
      if (isValid) {
        addDecisions();
        controllerDate!.clear();
        controllerTitle!.clear();
        controllerNumber!.clear();
        Get.offAll(() => ViewDecision());
      }
    }
  }

  addDecisions() async {
    var respose = await crud.postrequest(decisionsAdd, {
      'numdecisions': controllerNumber!.text,
      'date': controllerDate!.text,
      'title': controllerTitle!.text,
    });
    return respose;
  }

  onchangedate(DateTime d) async {
    if (d == null) return;
    controllerDate!.text = DateFormat('dd-MM-yyyy').format(d);
  }

  void initUser() {
    controllerTitle = TextEditingController();
    controllerDate = TextEditingController();
    controllerNumber = TextEditingController();
    controllerDate!.addListener(checkFields);
    controllerTitle!.addListener(checkFields);
    controllerNumber!.addListener(checkFields);
  }

  void checkFields() {
    allFieldsFilled.value = controllerDate!.text.isNotEmpty &&
        controllerTitle!.text.isNotEmpty &&
        controllerNumber!.text.isNotEmpty;
  }

  @override
  void onInit() {
    initUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
