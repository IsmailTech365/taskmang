// ignore_for_file: camel_case_types, unused_field, prefer_final_fields, prefer_typing_uninitialized_variables, unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, unnecessary_null_comparison, depend_on_referenced_packages, unrelated_type_equality_checks, iterable_contains_unrelated_type

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/class/crud_old.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import '../Data/Model/deatils.dart';
import 'package:intl/intl.dart';

class Edit_controller extends GetxController {
  final formkey_edit = GlobalKey<FormState>();
  int? id_card;
  List<String> selectedTeam = [];
  List<String> selectedDestination = [];
  List<String> itemfdb = [];
  TextEditingController? controllertarget;
  TextEditingController? controllerdate;
  TextEditingController? controllersupport;
  DateTime date = DateTime.now();
  Crud crud = Crud();
  RxBool allFieldsFilled = false.obs;
  RxBool? firstRadioSelected;
  void selectFirstRadio() {
    firstRadioSelected!.value = true;
  }

  void selectSecondRadio() {
    firstRadioSelected!.value = false;
  }

  onclick_ok() async {
    final form = formkey_edit.currentState!;
    bool isValid = form.validate();
    if (isValid) {
      edit_task();
    }
  }

  delete_task() async {
    var respose = await crud.postrequest(linkDelete, {
      'id': id_card.toString(),
    });
    return respose;
  }

  edit_task() async {
    var respose = await crud.postrequest(linkUpdate, {
      'id': id_card.toString(),
      'Date': controllerdate!.text,
      'Target': controllertarget!.text,
      'Supoort': controllersupport!.text,
      'Point': firstRadioSelected == true ? 'مباشر' : 'من المكتب',
      'Team': selectedTeam.join(' - '),
      'Destination': selectedDestination.join(' - '),
      'Driver': '',
    });
    return respose;
  }

  void fetchInitialData(Map<String, dynamic> idb) {
    id_card = jsonDecode(idb['id']);
    controllerdate!.text = idb['Date'];
    controllertarget!.text = idb['Target'];
    controllersupport!.text = idb['Supoort'];
    if (idb['Destination'] != null) {
      selectedDestination = (idb['Destination'] as String).split(' - ');
    }
    if (idb['Team'] != null) {
      selectedTeam = (idb['Team'] as String).split(' - ');
    }
    if (idb['Point'] == 'مباشر') {
      firstRadioSelected = true.obs;
    } else {
      firstRadioSelected = false.obs;
    }
  }

  onchangedate(DateTime d) async {
    if (d == null) return;
    controllerdate!.text = DateFormat('dd-MM-yyyy').format(d);
  }

  void initUser() {
    controllertarget = TextEditingController();
    controllerdate = TextEditingController();
    controllersupport = TextEditingController();
    itemfdb = Deatils().itemDestination;
  }

//////////////////////////////////////////////
  ///
  ///
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
