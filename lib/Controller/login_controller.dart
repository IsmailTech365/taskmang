// ignore_for_file: camel_case_types, unnecessary_new, non_constant_identifier_names, prefer_final_fields, avoid_print, prefer_const_constructors, unused_local_variable, dead_code, unused_element, body_might_complete_normally_nullable, deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Screen/home_screen.dart';
import 'package:nko_flutter/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Core/class/crud_old.dart';
import '../Core/constants/url.dart';

class Login_controller extends GetxController {
  GlobalKey<FormState> formkey_login = GlobalKey<FormState>();
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  var sharedcode = shardpref!.getString('code');
  late int id_code;
  int? pass;
  @override
  void onInit() async {
    code = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  late bool ob = true;
  IconData? c = Icons.visibility_off;
  onchange_suffixIcon() {
    if (ob == true) {
      ob = false;
      c = Icons.visibility_off;
    } else {
      ob = true;
      c = Icons.visibility;
    }
    update();
  }

  void lanchwhatsapp() async {
    String url =
        "whatsapp://send?phone=00963940096985&text=السلام عليكم ..\n ${code.text} يرجى تزويدي بكلمة المرور الخاصة بالحساب ";
    await canLaunchUrlString(url) ? launch(url) : print('');
  }

  Crud _crud = Crud();

  Login() async {
    if (formkey_login.currentState!.validate()) {
      var response = await _crud.postrequest(linklogin, {
        "id": code.text,
        "Password": password.text,
      });
      try {
        if (response['status'] == 'sucsees') {
          shardpref!.setString('code', response['data']['id'].toString());
          shardpref!.setString('name', response['data']['Name']);
          shardpref!.setString('depart', response['data']['Departement']);
          shardpref!.setString('image', response['data']['image_name']);
          Get.off(() => Main_Screen());
          print(shardpref!.get('code'));
          print(shardpref!.get('name'));
          print(shardpref!.get('depart'));
          print(shardpref!.get('image'));
        } else {
          Get.snackbar('', 'يرجى إدخال كلمة مرور صحيحة',
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
