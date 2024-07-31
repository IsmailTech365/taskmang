// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_const_constructors, duplicate_ignore, unnecessary_new, sized_box_for_whitespace, sort_child_properties_last, use_build_context_synchronously, unnecessary_this, avoid_print, unnecessary_null_comparison, unrelated_type_equality_checks, deprecated_member_use, must_be_immutable, unused_local_variable, dead_code
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/Core/constants/imageasset.dart';
import 'package:nko_flutter/View/Widget/auth/buttonlogin.dart';
import '../../Controller/login_controller.dart';
import '../Widget/auth/textFormLogin.dart';

class Login extends GetView<Login_controller> {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Login_controller());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: controller.formkey_login,
        child: Container(
          height: double.infinity,
          color: AppColor.blue,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                      Container(
                          width: MediaQuery.of(context).size.width - 10,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          child: Image.asset(AppImageAsset.onBordingImagesFour,
                              fit: BoxFit.fill)),
                      SizedBox(height: 30),
                      Login_TextField(
                        ispasswordtextfield: false,
                        lableText: 'Code',
                        mycontroller: controller.code,
                        prefix: Icon(
                          Icons.person,
                          color: AppColor.white,
                        ),
                        keyboardtype: TextInputType.number,
                        readonly: false,
                        hittext: '000',
                        ontapp: () {},
                        onedit: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                      SizedBox(height: 15),
                      Login_TextField(
                          mycontroller: controller.password,
                          lableText: 'Password',
                          prefix: Icon(
                            Icons.key,
                            color: AppColor.white,
                          ),
                          ontapp: () {},
                          onedit: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          ispasswordtextfield: true,
                          keyboardtype: TextInputType.number,
                          readonly: false,
                          hittext: 'Enter your Password'),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              child: Text(
                                'Forget PassWord',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                controller.lanchwhatsapp();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Login_Button(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
