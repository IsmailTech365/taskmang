// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, unnecessary_this, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Data/Model/tasks.dart';

class Card_Task extends StatelessWidget {
  final Tasks t;
  const Card_Task({
    super.key,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 20, 98, 128),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                // horizontal: 2,
                vertical: 10,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          style: ListTileStyle.drawer,
                          trailing: SingleChildScrollView(
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'NKO-Task-00${t.id}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 20, 98, 128)),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  t.date!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 20, 98, 128)),
                                ),
                              ],
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Departments ${t.department}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 20, 98, 128)),
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
                                        color: Color.fromARGB(255, 20, 98, 128),
                                      ),
                                    ),
                                    TextSpan(
                                      text: t.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 20, 98, 128),
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
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Destination: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                              TextSpan(
                                                text: t.destination,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.playlist_add_check_sharp,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Target: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                              TextSpan(
                                                text: t.target,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.group_outlined,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Team Members: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 20, 98, 128),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: t.team,
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color.fromARGB(
                                                        255, 20, 98, 128),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              t.supoort != ''
                                  ? Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Icon(
                                          Icons.group_outlined,
                                          color:
                                              Color.fromARGB(255, 20, 98, 128),
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Support: ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 20, 98, 128),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: t.supoort,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Color.fromARGB(
                                                            255, 20, 98, 128),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              t.supoort != ''
                                  ? SizedBox(height: 8)
                                  : SizedBox(),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Point: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                              TextSpan(
                                                text: t.point,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromARGB(
                                                      255, 20, 98, 128),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.drive_eta_rounded,
                                    color: Color.fromARGB(255, 20, 98, 128),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          'Driver: ',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 20, 98, 128),
                                          ),
                                        ),
                                        Text(
                                          t.driver!,
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 20, 98, 128),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 98, 128),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  TextButton.icon(
                                    style: ButtonStyle(
                                        iconColor: t.hR == 1
                                            ? WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 39, 204, 172))
                                            : WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 255, 0, 0))),
                                    onPressed: () {
                                      Get.snackbar('تحذير',
                                          'الموافقة والرفض خاصة بمسؤول الموارد البشرية');
                                    },
                                    icon: FaIcon(FontAwesomeIcons.circleCheck),
                                    label: Text(
                                      'HR',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  TextButton.icon(
                                    style: ButtonStyle(
                                        iconColor: t.administrator == 1
                                            ? WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 39, 204, 172))
                                            : WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 255, 0, 0))),
                                    onPressed: () {
                                      Get.snackbar('تحذير',
                                          'الموافقة والرفض خاصة بمدير مكتب سوريا');
                                    },
                                    icon: FaIcon(FontAwesomeIcons.circleCheck),
                                    label: Text(
                                      'Admin',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  TextButton.icon(
                                    style: ButtonStyle(
                                        iconColor: t.security == 1
                                            ? WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 39, 204, 172))
                                            : WidgetStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 255, 0, 0))),
                                    onPressed: () {
                                      Get.snackbar('تحذير',
                                          'الموافقة والرفض خاصة  بمسؤول الامن والسلامة');
                                    },
                                    icon: FaIcon(FontAwesomeIcons.circleCheck),
                                    label: Text(
                                      'Scurity',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ]))
                      ]))),
        ),
      ],
    );
  }
}
