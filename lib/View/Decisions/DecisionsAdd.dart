// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Widget/Decisions/TextFormDecision.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import 'package:nko_flutter/View/Widget/Tasks/TextFormField.dart';
import '../../../Controller/addDecisionController.dart';

class AddDecision extends GetView<Decisionaddcontroller> {
  const AddDecision({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Decisionaddcontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('إضافة قرار'),
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
                            const Text(
                              'Number:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                              controller: controller.controllerNumber,
                              lableText: 'Number:',
                              hittext: 'Number of Decision',
                              prefix: const Icon(
                                Icons.playlist_add_check_outlined,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى اختيار رقم القرار';
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
                            const SizedBox(height: 10),
                            const Text(
                              'Date:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            MyTextFormField(
                              controller: controller.controllerDate,
                              lableText: 'Date',
                              hittext: 'Select Decision Date',
                              prefix: const Icon(
                                color: Color.fromARGB(255, 20, 98, 128),
                                Icons.calendar_today_outlined,
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى اختيار تاريخ القرار';
                                }
                                return null;
                              },
                              onedit: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              readonly: true,
                              keyboardtype: TextInputType.datetime,
                              ontapp: () async {
                                DateTime? pickeddata = await showDatePicker(
                                  context: context,
                                  initialDate: controller.date,
                                  firstDate: controller.date,
                                  lastDate: DateTime(2025),
                                );
                                controller.onchangedate(pickeddata!);
                              },
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Decision:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            const SizedBox(height: 3),
                            DecisionsTitle(
                              controller: controller.controllerTitle,
                              lableText: 'Decision:',
                              prefix: const Icon(
                                Icons.playlist_add_check_outlined,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى كتابةالقرار قبل التأكيد';
                                }
                                if (!RegExp(r'^(?=.*[a-zA-Zء-ي]).+$')
                                    .hasMatch(value)) {
                                  return 'الرجاء إدخال حرف واحد عربي أو إنجليزي على الأقل';
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
                            ),
                            const SizedBox(height: 8),
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
