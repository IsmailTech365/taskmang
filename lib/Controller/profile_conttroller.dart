// ignore_for_file: camel_case_types, prefer_final_fields, avoid_print, prefer_typing_uninitialized_variables, unused_local_variable, non_constant_identifier_names, depend_on_referenced_packages

// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import '../Core/class/crud_old.dart';
import '../main.dart';

class Profile_controller extends GetxController {
  //////// هامة لأعادة تركيز الصفحة هامممممممممممة جددددددداااااا///////////////////
  final focusNode = FocusNode();
  void setFocus() {
    if (!focusNode.hasFocus) {
      focusNode.requestFocus();
    } else {
      focusNode.unfocus();
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////

  final formkey = GlobalKey<FormState>();
  File image = File('${shardpref!.getString('image')}');
  Crud crud = Crud();
  final imagePicker = ImagePicker();
  uploadimagecamera() async {
    XFile? pickedimage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      await img();
    } else {}
  }

  uploadimagegallary() async {
    XFile? pickedimage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      await img();
    } else {}
  }

  logout() async {
    shardpref!.clear();
  }

  img() async {
    var response = await crud.postRequestWithFile(
        linkEditImage,
        {
          'id': '${shardpref!.getString('code')}',
          'image_name': '${shardpref!.getString('image')}'
        },
        image);
    if (response["status"] == "sucsees") {
      await img_view();
    }
    return response;
  }

  img_view() async {
    var response = await crud.postrequest(linkusers, {
      'id': '${shardpref!.getString('code')}',
    });
    if (response["status"] == "sucsees") {
      if (shardpref!.getString('image') == '') {
        shardpref!.setString('image', response['data']['image_name']);
      } else {
        shardpref!.remove('image');
        shardpref!.setString('image', response['data']['image_name']);
      }
    }
    return response;
  }
}
