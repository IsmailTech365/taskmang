// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, unrelated_type_equality_checks, camel_case_types, invalid_use_of_protected_member

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import 'package:nko_flutter/Controller/addTaskcontroller.dart';
import 'package:nko_flutter/View/Widget/Tasks/TextFormField.dart';
import '../../../Data/Model/deatils.dart';

class Add_Task extends GetView<Add_controller> {
  Add_Task({super.key});

  final Add_controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text('6'.tr),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                c.onclick_ok();
              },
              icon: FaIcon(c.allFieldsFilled.value
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
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
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
                      key: c.formkey_add,
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
                                              groupValue: controller
                                                  .firstRadioSelected.value,
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
                                              groupValue: controller
                                                  .firstRadioSelected.value,
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
                              'Sub District:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                            ),
                            SizedBox(height: 3),
                            DropdownSearch<String>(
                              items: Deatils().sub_district_Items,
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
                              selectedItem: c.selectedItem,
                              onChanged: (value) {
                                c.onchange_city(value);
                              },
                            ),
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
