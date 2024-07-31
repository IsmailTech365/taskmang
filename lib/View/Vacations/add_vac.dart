// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, avoid_unnecessary_containers, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Controller/vac_add_controller.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import 'package:nko_flutter/View/Widget/Vacations/stepperVac.dart';

class Add_Vac extends StatelessWidget {
  const Add_Vac({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Vac_add_controller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text('طلب إجازة'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
      ),
      drawer: Drawer_all(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: StepperAddVAc()),
    );
  }
}
