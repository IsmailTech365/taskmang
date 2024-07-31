// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Data/Model/decision.dart';
import 'package:nko_flutter/View/Decisions/DecisionsAdd.dart';
import 'package:nko_flutter/View/Widget/Decisions/DecisionsCard.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import '../../../Controller/viewDecisiController.dart';
import '../../../Controller/bindings.dart';
import '../../../Core/class/statusrequest.dart';

class ViewDecision extends StatelessWidget {
  const ViewDecision({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DecisionsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text('قرارات المنظمة'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 39, 204, 172),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            Get.off(() => AddDecision(), binding: Binding_vac_add());
          },
          child: FaIcon(FontAwesomeIcons.plus)),
      drawer: Drawer_all(),
      body: ListView(
        children: [
          GetBuilder<DecisionsController>(builder: (controller) {
            if (controller.statusRequest == StatusRequest.loding) {
              return Container(
                child: Center(
                    child: SpinKitFadingFour(
                  size: 32,
                  color: Color.fromARGB(255, 20, 98, 128),
                )),
              );
            } else if (controller.statusRequest ==
                StatusRequest.offlinefailure) {
              return Container(
                child: const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                        color: Colors.white, Icons.wifi_off_outlined, size: 36),
                    SizedBox(height: 20),
                    Text('Please check internet connection',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Tajawal')),
                  ],
                )),
              );
            } else if (controller.statusRequest ==
                StatusRequest.serverfailure) {
              return Container(
                child: const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                        color: Colors.white, Icons.wifi_off_outlined, size: 36),
                    SizedBox(height: 20),
                    Text('Server failure',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontFamily: 'Tajawal')),
                  ],
                )),
              );
            } else if (controller.statusRequest == StatusRequest.failure) {
              return Container(
                child: const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                        color: Colors.white, Icons.wifi_off_outlined, size: 36),
                    SizedBox(height: 20),
                    Text('No Data',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontFamily: 'Tajawal')),
                  ],
                )),
              );
            } else {
              return ListView.builder(
                  itemCount: controller.data.length,
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CardDecisions(
                      t: Decisions.fromJson(controller.data[i]),
                    );
                  });
            }
          }),
        ],
      ),
    );
  }
}
