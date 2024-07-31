// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/addEmployeController.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import 'package:nko_flutter/View/Widget/Tasks/TextFormField.dart';

class AddEmploy extends GetView<AddEmploye> {
  const AddEmploy({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEmploye());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('إضافة موظف جديد'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 98, 128),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                controller.onclick_ok();
              },
              icon: FaIcon(controller.allFieldsFilled.value
                  ? (FontAwesomeIcons.check)
                  : (FontAwesomeIcons.xmark)))),
        ],
      ),
      drawer: Drawer_all(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Form(
                      key: controller.formkey_add,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: ListView(
                          padding: const EdgeInsets.only(top: 10),
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'كود الموظف :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                              controller: controller.controllercode,
                              lableText: 'Code:',
                              hittext: 'Code of Employe',
                              prefix: const Icon(
                                Icons.numbers,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى اختيار كود الموظف';
                                }

                                return null;
                              },
                              onedit: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              ontapp: () {},
                              readonly: false,
                              keyboardtype: TextInputType.number,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'اسم الموظف :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                                controller: controller.controllerName,
                                validatortext: (value) {
                                  if (value.isNotEmpty) {
                                    if (!RegExp(r'^(?=.*[a-zA-Zء-ي]).+$')
                                        .hasMatch(value)) {
                                      return 'الرجاء إدخال حرف واحد عربي أو إنجليزي على الأقل';
                                    }
                                  }

                                  return null;
                                },
                                onedit: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                ontapp: () {},
                                readonly: false,
                                keyboardtype: TextInputType.text,
                                lableText: 'Name',
                                prefix: const Icon(
                                  Icons.person_outline,
                                  color: Color.fromARGB(255, 20, 98, 128),
                                ),
                                hittext: 'Name Employe'),
                            const SizedBox(height: 8),
                            const Text(
                              'القسم :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                                controller: controller.controllerDepart,
                                validatortext: (value) {
                                  if (value.isNotEmpty) {
                                    if (!RegExp(r'^(?=.*[a-zA-Zء-ي]).+$')
                                        .hasMatch(value)) {
                                      return 'الرجاء إدخال حرف واحد عربي أو إنجليزي على الأقل';
                                    }
                                  }

                                  return null;
                                },
                                onedit: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                ontapp: () {},
                                readonly: false,
                                keyboardtype: TextInputType.text,
                                lableText: 'Departement',
                                prefix: const Icon(
                                  Icons.local_post_office_outlined,
                                  color: Color.fromARGB(255, 20, 98, 128),
                                ),
                                hittext: 'Select Departement'),
                            const SizedBox(height: 8),
                            const Text(
                              'المسمى الوظيفي :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                                controller: controller.controllerPosition,
                                validatortext: (value) {
                                  if (value.isNotEmpty) {
                                    if (!RegExp(r'^(?=.*[a-zA-Zء-ي]).+$')
                                        .hasMatch(value)) {
                                      return 'الرجاء إدخال حرف واحد عربي أو إنجليزي على الأقل';
                                    }
                                  }

                                  return null;
                                },
                                onedit: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                ontapp: () {},
                                readonly: false,
                                keyboardtype: TextInputType.text,
                                lableText: 'Position',
                                prefix: const Icon(
                                  Icons.description_outlined,
                                  color: Color.fromARGB(255, 20, 98, 128),
                                ),
                                hittext: 'Select Position'),
                            const SizedBox(height: 8),
                            const Text(
                              'كلمة المرور :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                                controller: controller.controllerPassword,
                                validatortext: (value) {
                                  if (value.isNotEmpty) {
                                    if (!RegExp(r'^(?=.*[a-zA-Zء-ي]).+$')
                                        .hasMatch(value)) {
                                      return 'الرجاء إدخال حرف واحد عربي أو إنجليزي على الأقل';
                                    }
                                  }

                                  return null;
                                },
                                onedit: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                ontapp: () {},
                                readonly: false,
                                keyboardtype: TextInputType.text,
                                lableText: 'PassWord',
                                prefix: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Color.fromARGB(255, 20, 98, 128),
                                ),
                                hittext: 'Select Password'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
