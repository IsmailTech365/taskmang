// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/login_controller.dart';
import 'package:nko_flutter/Core/constants/color.dart';

class Login_Button extends GetView<Login_controller> {
  const Login_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await controller.Login();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.green,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Log in',
        style: TextStyle(
            height: 2,
            fontFamily: 'Tajawal',
            fontSize: 20,
            letterSpacing: 1,
            color: AppColor.white),
      ),
    );
  }
}
