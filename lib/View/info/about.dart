// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, unnecessary_new, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Widget/Home/Mydrawer.dart';

class About extends StatelessWidget {
  About({super.key});

  final formkey = GlobalKey<FormState>();

  void lanchwhatsapp({@required number, @required messag}) async {
    String url = "whatsapp://send?phone=$number&text=$messag";
    await canLaunchUrlString(url) ? launch(url) : print('object');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('4'.tr),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
      ),
      backgroundColor: Color.fromARGB(255, 20, 98, 128),
      drawer: Drawer_all(),
      body: Container(
        padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color.fromARGB(255, 221, 226, 230),
                      Color.fromARGB(255, 213, 216, 221),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
                    key: formkey,
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: ListView(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            height: 200,
                            'assets/images/1.png',
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 5),
                          Divider(endIndent: 20, indent: 20),
                          SizedBox(height: 5),
                          Text(
                            "",
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 98, 128),
                                fontSize: 18,
                                letterSpacing: 0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                lanchwhatsapp(number: '+963940096985', messag: 'السلام عليكم');
              },
              child: Text(
                'تواصل مع المطور',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 20, 98, 128),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 39, 204, 172),
                padding: EdgeInsets.symmetric(horizontal: 90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
