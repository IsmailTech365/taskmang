// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, unnecessary_new, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/Controller/local_controllar.dart';
import 'package:nko_flutter/Controller/profile_conttroller.dart';
import 'package:nko_flutter/View/Screen/login.dart';
import 'package:nko_flutter/main.dart';
import '../Widget/Home/Mydrawer.dart';

class ProfileSetting extends StatelessWidget {
  ProfileSetting({super.key});
  Profile_controller c = Get.put(Profile_controller());
  Localcontrollar langC = Get.find();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text("EN"),
        value: "en",
        alignment: Alignment.center,
      ),
      DropdownMenuItem(
        child: Text("AR"),
        value: "ar",
        alignment: Alignment.center,
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        c.setFocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('5'.tr),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 20, 98, 128),
        ),
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
        drawer: Drawer_all(),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.0,
                    ),
                    child: Form(
                      key: c.formkey,
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: GestureDetector(
                          onTap: () {
                            c.setFocus();
                          },
                          child: ListView(
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: shardpref!.getString('image') ==
                                                null
                                            ? Icon(
                                                Icons.photo,
                                                color: Color.fromARGB(
                                                    255, 20, 98, 128),
                                                size: 40,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: shardpref!.getString(
                                                            'image') !=
                                                        null
                                                    ? Image.network(
                                                        '$linkImage${shardpref!.getString('image')}',
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Icon(
                                                        Icons.photo,
                                                        color: Color.fromARGB(
                                                            255, 20, 98, 128),
                                                        size: 40,
                                                      )),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 20, 98, 128),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1))
                                          ],
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 20, 98, 128),
                                            ),
                                            color: Colors.blue[300],
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.bottomSheet(SizedBox(
                                                height: 130,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Text(
                                                      'Where to choose the image',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.blue),
                                                    ),
                                                    SizedBox(height: 30),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            child: InkWell(
                                                          onTap: c
                                                              .uploadimagegallary,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                color: Colors
                                                                    .blueGrey,
                                                                size: 30,
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  'From Gallary',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                              .blue[
                                                                          600]))
                                                            ],
                                                          ),
                                                        )),
                                                        Expanded(
                                                            child: InkWell(
                                                          onTap: () {
                                                            c.uploadimagecamera();
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .camera_enhance,
                                                                color: Colors
                                                                    .blueGrey,
                                                                size: 30,
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                'From Camera',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                            .blue[
                                                                        600]),
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ));
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Profile',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '\nNKO-SYR-00${shardpref!.get('code')}\n${shardpref!.get('name')}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 20, 98, 128))),
                                    Text('\n${shardpref!.get('depart')}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 20, 98, 128))),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              ListTile(
                                title: Text('Rest Password',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                                onTap: () {
                                  print('${shardpref!.get('image')}');
                                },
                                leading: Icon(Icons.remove_red_eye_outlined),
                                trailing: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(Icons.arrow_forward_ios_outlined,
                                      size: 18),
                                ),
                              ),
                              Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Settings',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                              ),
                              ListTile(
                                title: Text('language',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                                onTap: () {},
                                leading: Icon(Icons.language),
                                // trailing: SwitchListTile(
                                //     value: true,
                                //     onChanged: (v) {
                                //       if (shardpref!.getString('lang') ==
                                //           'ar') {
                                //         shardpref!.remove('lang');
                                //         langC.changelang('en');
                                //       } else {
                                //         shardpref!.remove('lang');
                                //         langC.changelang('ar');
                                //       }
                                //     }),
                                // trailing: LiteRollingSwitch(
                                //   textOn: ' AR',
                                //   textOff: ' EN',
                                //   textOnColor: Color.fromARGB(255, 20, 98, 128),
                                //   textOffColor:
                                //       Color.fromARGB(255, 20, 98, 128),
                                //   colorOn: Colors.white,
                                //   colorOff: Colors.white,
                                //   onTap: () {
                                //     if (shardpref!.getString('lang') == 'ar') {
                                //       shardpref!.remove('lang');
                                //       langC.changelang('en');
                                //     } else {
                                //       shardpref!.remove('lang');
                                //       langC.changelang('ar');
                                //     }
                                //   },
                                //   onDoubleTap: () {},
                                //   onSwipe: () {},
                                //   onChanged: (v) {},
                                // ),
                              ),
                              ListTile(
                                title: Text('Them',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                                onTap: () {},
                                leading: Icon(Icons.dark_mode_outlined),
                              ),
                              Divider(
                                endIndent: 20,
                                indent: 20,
                                color: Color.fromARGB(255, 20, 98, 128),
                              ),
                              ListTile(
                                title: Text('Log out',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 20, 98, 128))),
                                onTap: () {
                                  c.logout();
                                  Get.offAll(() => Login(),
                                      binding: Binding_login());
                                },
                                leading: Icon(Icons.logout_outlined),
                              ),
                            ],
                          ),
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
