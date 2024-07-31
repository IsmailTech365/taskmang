// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Core/constants/color.dart';
import 'package:nko_flutter/Data/Model/vacations.dart';

class CardVacation extends StatelessWidget {
  Vacations t;
  CardVacation({
    required this.t,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        elevation: 4,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColor.blue,
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                style: ListTileStyle.drawer,
                trailing: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'NKO-Task-00${t.id}',
                        style: const TextStyle(
                            color: AppColor.blue),
                      ),
                      SizedBox(height: 10),
                      Text(
                        t.dateVac!,
                        style: const TextStyle(
                            color:AppColor.blue),
                      ),
                    ],
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department ${t.departement}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.blue,
                      ),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Name: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.blue,
                            ),
                          ),
                          TextSpan(
                            text: t.name,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColor.blue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.playlist_add_check_sharp,
                                  color: AppColor.blue,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${t.typeVac}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule_outlined,
                                  color: AppColor.blue,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${t.time}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.blue,
                                  ),
                                ),
                                SizedBox(width: 50),
                                t.time == 'نصف يوم'
                                    ? Icon(
                                        Icons.history_outlined,
                                        color: AppColor.blue,
                                      )
                                    : SizedBox(width: 10),
                                Text(
                                  '${t.period}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.blue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Get.snackbar(
                                'تحذير', 'الموافقة والرفض خاصة  بمسؤول القسم ',
                                snackPosition: SnackPosition.BOTTOM);
                          },
                          icon: const FaIcon(FontAwesomeIcons.circleCheck),
                          color:
                              t.approval == 1 ? AppColor.green : AppColor.red,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ])));
  }
}
