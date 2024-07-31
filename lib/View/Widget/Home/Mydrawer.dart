// ignore_for_file: prefer_const_constructors, must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, sort_child_properties_last, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/View/Decisions/DecisionsAdd.dart';
import 'package:nko_flutter/View/Screen/home_screen.dart';
import 'package:nko_flutter/View/Task/add_task.dart';
import 'package:nko_flutter/View/Vacations/add_vac.dart';
import 'package:nko_flutter/View/employ/addEmploy.dart';
import 'package:nko_flutter/View/info/profile.dart';
import 'package:nko_flutter/main.dart';

import '../../info/about.dart';

class Drawer_all extends StatelessWidget {
  Drawer_all({super.key});
  File? image;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        width: _w / 1.52,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                                width: 70,
                                height: 70,
                                child: shardpref!.getString('image') == null
                                    ? InkWell(
                                        onTap: () {
                                          // Get.off(() => ProfileSetting(),
                                          //     binding: Binding_profile());
                                        },
                                        child: Icon(Icons.photo,
                                            color: AppColor.white, size: 28))
                                    : InkWell(
                                        onTap: () {
                                          // Get.off(() => ProfileSetting());
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.network(
                                                '$linkImage${shardpref!.getString('image')}',
                                                fit: BoxFit.fill)),
                                      ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1.5, color: AppColor.white),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1))
                                  ],
                                )),
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.dark_mode_outlined,
                                      color: AppColor.white, size: 24)),
                              SizedBox(height: 20),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${shardpref!.get('name')}',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.white,
                            fontFamily: 'Tajawal',
                          )),
                      SizedBox(height: 5),
                      Text('${shardpref!.get('depart')}',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.white,
                            fontFamily: 'Tajawal',
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: AppColor.blue,
              ),
              title: Text('الصفحة الرئيسية',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => Main_Screen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_task,
                color: AppColor.blue,
              ),
              title: Text('إضافة مهمـة',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => Add_Task(), binding: Binding_add_task());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_alarm,
                color: AppColor.blue,
              ),
              title: Text('طلب إجازة',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => Add_Vac());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_box,
                color: AppColor.blue,
              ),
              title: Text('إضافة تقرير',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => AddDecision());
              },
            ),
            ExpansionTile(
              leading: Icon(
                Icons.group,
                color: AppColor.blue,
              ),
              title: Text('بيانات الموظفين',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: AppColor.blue,
                  ),
                  title: Text('إضافة موظف',
                      style: TextStyle(
                        color: AppColor.blue,
                      )),
                  onTap: () {
                    Get.to(() => AddEmploy());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit_notifications,
                    color: AppColor.blue,
                  ),
                  title: Text('تعديل بيانات موظف',
                      style: TextStyle(
                        color: AppColor.blue,
                      )),
                  onTap: () {},
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.place,
                color: AppColor.blue,
              ),
              title: Text('بيانات المناطق الجغرافية',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.place,
                    color: AppColor.blue,
                  ),
                  title: Text('إضافة مدينة',
                      style: TextStyle(
                        color: AppColor.blue,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.edit_location,
                    color: AppColor.blue,
                  ),
                  title: Text('تعديل بيانات المدن',
                      style: TextStyle(
                        color: AppColor.blue,
                      )),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: AppColor.blue,
              ),
              title: Text('الإعدادات',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => ProfileSetting(), binding: Binding_profile());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mobile_friendly,
                color: AppColor.blue,
              ),
              title: Text('حول التطبيق',
                  style: TextStyle(
                    color: AppColor.blue,
                  )),
              onTap: () {
                Get.off(() => About());
              },
            ),
          ],
        ),
      ),
    );
  }
}
