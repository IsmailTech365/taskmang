// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, unrelated_type_equality_checks, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Widget/Tasks/TextFormField.dart';
import '../../../Controller/edit_controller.dart';
import '../../../Data/Model/deatils.dart';
import 'Home_task.dart';

class Edit_Task extends GetView<Edit_controller> {
  final Map<String, dynamic> idb;
  Edit_Task({required this.idb});
  final Edit_controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fetchInitialData(idb);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 98, 128),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomeTask());
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await c.delete_task();
              Get.off(() => HomeTask());
            },
            icon: FaIcon(FontAwesomeIcons.trashCan),
          ),
          IconButton(
            onPressed: () async {
              await c.onclick_ok();
              Get.off(() => HomeTask());
            },
            icon: FaIcon(FontAwesomeIcons.floppyDisk),
          ),
        ],
        title: Text('Edit Task'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color.fromARGB(255, 221, 232, 230),
                        Color.fromARGB(255, 213, 216, 221),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Form(
                      key: c.formkey_edit,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: ListView(
                          padding: EdgeInsets.only(top: 10),
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            MyTextFormField(
                              controller: c.controllerdate,
                              lableText: 'Date',
                              hittext: 'Select Task Date',
                              prefix: Icon(
                                color: Color.fromARGB(255, 20, 98, 128),
                                Icons.calendar_today_outlined,
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى اختيار تاريخ المهمة';
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
                                  initialDate: c.date,
                                  firstDate: c.date,
                                  lastDate: DateTime(2025),
                                );
                                c.onchangedate(pickeddata!);
                              },
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Target:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            MyTextFormField(
                              controller: c.controllertarget,
                              lableText: 'Target:',
                              hittext: 'Target from Task',
                              prefix: Icon(
                                Icons.playlist_add_check_outlined,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              validatortext: (value) {
                                if (value.isEmpty) {
                                  return 'يرجى اختيار الهدف من المهمة';
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
                            SizedBox(height: 8),
                            Text(
                              'Point',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            Wrap(children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Immediate',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Tajawal',
                                              color: Color.fromARGB(
                                                  255, 20, 98, 128),
                                            ),
                                          ),
                                          Obx(
                                            () => Radio(
                                              value: true,
                                              groupValue:
                                                  c.firstRadioSelected!.value,
                                              activeColor: Color.fromARGB(
                                                  255, 20, 98, 128),
                                              onChanged: (value) {
                                                controller.selectFirstRadio();
                                              },
                                            ),
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'From Office',
                                            style: TextStyle(
                                              fontFamily: 'Tajawal',
                                              color: Color.fromARGB(
                                                  255, 20, 98, 128),
                                              fontSize: 16,
                                            ),
                                          ),
                                          Obx(
                                            () => Radio(
                                              value: false,
                                              groupValue:
                                                  c.firstRadioSelected!.value,
                                              activeColor: Color.fromARGB(
                                                  255, 20, 98, 128),
                                              onChanged: (value) {
                                                controller.selectSecondRadio();
                                              },
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ]),
                            SizedBox(height: 8),
                            Text(
                              'Team Members:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            DropdownSearch<String>.multiSelection(
                              items: Deatils().itemsTeams,
                              validator: (value) => value!.isEmpty
                                  ? 'Please select team members'
                                  : null,
                              onSaved: (value) {
                                value = null;
                              },
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 20, 98, 128),
                                    fontSize: 18,
                                  ),
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16),
                                  hintText: 'select team members',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.groups_2_outlined,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                ),
                              ),
                              popupProps: PopupPropsMultiSelection.dialog(
                                  fit: FlexFit.tight,
                                  showSelectedItems: true,
                                  constraints: BoxConstraints(
                                      minWidth: 500,
                                      maxWidth: 500,
                                      maxHeight: 600),
                                  showSearchBox: true),
                              selectedItems: c.selectedTeam,
                              onChanged: (value) {
                                c.selectedTeam = value;
                              },
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Support',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            MyTextFormField(
                                controller: c.controllersupport,
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
                                lableText: 'Support',
                                prefix: Icon(
                                  Icons.group_add_outlined,
                                  color: Color.fromARGB(255, 20, 98, 128),
                                ),
                                hittext: 'Select Support'),
                            SizedBox(height: 8),
                            Text(
                              'Destination:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            DropdownSearch<String>.multiSelection(
                              items: c.itemfdb,
                              validator: (value) => value!.isEmpty
                                  ? 'Please choose the location'
                                  : null,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'Tajawal',
                                    color: Color.fromARGB(255, 20, 98, 128),
                                    fontSize: 18,
                                  ),
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16),
                                  hintText: 'choose the location',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.pin_drop_outlined,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                ),
                              ),
                              popupProps: PopupPropsMultiSelection.dialog(
                                  favoriteItemProps: FavoriteItemProps(),
                                  fit: FlexFit.tight,
                                  showSelectedItems: true,
                                  constraints: BoxConstraints(
                                    minWidth: 500,
                                    maxWidth: 500,
                                    maxHeight: 600,
                                  ),
                                  showSearchBox: true),
                              selectedItems: c.selectedDestination,
                              onChanged: (value) {
                                c.selectedDestination = value;
                              },
                            ),
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
