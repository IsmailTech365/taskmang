// ignore_for_file: camel_case_types, unused_field, prefer_final_fields, prefer_typing_uninitialized_variables, unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, unnecessary_null_comparison, depend_on_referenced_packages, unrelated_type_equality_checks, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/class/crud_old.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/View/Task/Home_task.dart';
import 'package:nko_flutter/main.dart';
import '../Data/Model/deatils.dart';
import 'package:intl/intl.dart';

class Add_controller extends GetxController {
  GlobalKey<FormState> formkey_add = GlobalKey<FormState>();
  String selectedItem = '7'.tr;
  List<String> selectedTeam = [];
  List<String> selectedDestination = [];
  TextEditingController? controllertarget;
  TextEditingController? controllerdate;
  TextEditingController? controllersupport;
  List<String> itemfdb = [];
  DateTime date = DateTime.now();
  Crud crud = Crud();
  RxBool allFieldsFilled = false.obs;
  RxBool firstRadioSelected = false.obs;

  onchange_city(String? value) {
    //  selectedItem = value!;
    if (value == 'جميع المناطق') {
      itemfdb = Deatils().itemDestination;
    }
    if (value == 'سلقين') {
      itemfdb = Deatils().salqin;
    }
    if (value == 'سرمين') {
      itemfdb = Deatils().sarmin;
    }
    if (value == 'أريحا') {
      itemfdb = Deatils().ariha;
    }
    if (value == 'احسم') {
      itemfdb = Deatils().ehsem;
    }
    if (value == 'محمبل') {
      itemfdb = Deatils().mhambal;
    }
    if (value == 'حارم') {
      itemfdb = Deatils().harem;
    }
    if (value == 'الدانا') {
      itemfdb = Deatils().dana;
    }
    if (value == 'كفر تخاريم') {
      itemfdb = Deatils().kafarTakharim;
    }
    if (value == 'قورقينا') {
      itemfdb = Deatils().qourqania;
    }
    if (value == 'أرمناز') {
      itemfdb = Deatils().armanaz;
    }
    if (value == 'إدلب') {
      itemfdb = Deatils().idleb;
    }
    if (value == 'بنش') {
      itemfdb = Deatils().benesh;
    }
    if (value == 'تفتناز') {
      itemfdb = Deatils().taftanaz;
    }
    if (value == 'معرة تمصرين') {
      itemfdb = Deatils().maaretTarmsrin;
    }
    if (value == 'جسر الشغور') {
      itemfdb = Deatils().jisrShaghour;
    }
    if (value == 'بداما') {
      itemfdb = Deatils().bdama;
    }
    if (value == 'دركوش') {
      itemfdb = Deatils().darkoush;
    }
    if (value == 'الجانودية') {
      itemfdb = Deatils().janodia;
    }
    if (value == 'اعزاز') {
      itemfdb = Deatils().izaz;
    }
    if (value == 'جرابلس') {
      itemfdb = Deatils().jarablus;
    }
    if (value == 'الأتارب') {
      itemfdb = Deatils().atareb;
    }
    if (value == 'عفرين') {
      itemfdb = Deatils().ifrine;
    }
    if (value == 'دارة عزة') {
      itemfdb = Deatils().daretIzaa;
    }
    if (value == 'الباب') {
      itemfdb = Deatils().bab;
    }
    if (value == 'كللي') {
      itemfdb = Deatils().kelly;
    }
  }

  void selectFirstRadio() {
    firstRadioSelected.value = true;
  }

  void selectSecondRadio() {
    firstRadioSelected.value = false;
  }

  onclick_ok() async {
    if (allFieldsFilled.value == true) {
      final form = formkey_add.currentState!;
      bool isValid = form.validate();
      if (isValid) {
        add_task();
        controllerdate!.clear();
        controllertarget!.clear();
        controllersupport!.clear();
        selectedTeam = [];
        selectedDestination = [];
        Get.off(() => HomeTask());
      }
    } else {
      Get.off(() => HomeTask());
    }
  }

  add_task() async {
    var respose = await crud.postrequest(linkAdd, {
      'code': shardpref!.get('code'),
      'Department': shardpref!.get('depart'),
      'Name': shardpref!.getString('name'),
      'Date': controllerdate!.text,
      'Target': controllertarget!.text,
      'Supoort': controllersupport!.text,
      'Point': firstRadioSelected == true ? 'مباشر' : 'من المكتب',
      'Team': selectedTeam.join(', '),
      'Destination': selectedDestination.join(' - '),
      'Driver': '',
      'security': '1',
      'administrator': '1',
      'HR': '1',
    });
    return respose;
  }

  onchangedate(DateTime d) async {
    if (d == null) return;
    controllerdate!.text = DateFormat('dd-MM-yyyy').format(d);
  }

  void initUser() {
    controllertarget = TextEditingController();
    controllerdate = TextEditingController();
    controllersupport = TextEditingController();
    controllerdate!.addListener(checkFields);
    controllertarget!.addListener(checkFields);
    itemfdb = Deatils().itemDestination;
  }

  void checkFields() {
    allFieldsFilled.value =
        controllertarget!.text.isNotEmpty && controllerdate!.text.isNotEmpty;
  }

//////////////////////////////////////////////

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
