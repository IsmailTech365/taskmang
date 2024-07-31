// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Widget/Home/Mydrawer.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/Core/class/statusrequest.dart';
import 'package:nko_flutter/View/Widget/Tasks/slidable.dart';
import '../../../Controller/viewTaskcontroller.dart';
import 'add_task.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ViewTaskscontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text('8'.tr),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 98, 128),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 39, 204, 172),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            Get.off(() => Add_Task(), binding: Binding_add_task());
          },
          child: const FaIcon(FontAwesomeIcons.plus)),
      drawer: Drawer_all(),
      body: ListView(
        children: [
          GetBuilder<ViewTaskscontroller>(builder: (controller) {
            if (controller.statusRequest == StatusRequest.loding) {
              return const Center(
                  child: SpinKitFadingFour(
                size: 32,
                color: Color.fromARGB(255, 20, 98, 128),
              ));
            } else if (controller.statusRequest ==
                StatusRequest.offlinefailure) {
              return const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(color: Colors.white, Icons.wifi_off_outlined, size: 36),
                  SizedBox(height: 20),
                  Text('Please check internet connection',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Tajawal')),
                ],
              ));
            } else if (controller.statusRequest ==
                StatusRequest.serverfailure) {
              return const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(color: Colors.white, Icons.wifi_off_outlined, size: 36),
                  SizedBox(height: 20),
                  Text('Server failure',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontFamily: 'Tajawal')),
                ],
              ));
            } else if (controller.statusRequest == StatusRequest.failure) {
              return const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(color: Colors.white, Icons.wifi_off_outlined, size: 36),
                  SizedBox(height: 20),
                  Text('No Data',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 24,
                          fontFamily: 'Tajawal')),
                ],
              ));
            } else {
              return const SlidableTask();
            }
          }),
        ],
      ),
    );
  }
}


/*
// ignore_for_file: dead_code, avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, unused_import, must_be_immutable, camel_case_types, file_names, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/Constants/Widgets/Mydrawer.dart';
import 'package:nko_flutter/Controller/bindings.dart';
import 'package:nko_flutter/Model/tasks.dart';
import 'package:nko_flutter/View/info/about.dart';
import 'package:nko_flutter/View/info/profile.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../Constants/Widgets/card_task.dart';
import '../../../Controller/home_controller.dart';
import '../../../utils/pdf_api.dart';
import 'pdf.dart';
import 'add_task.dart';
import 'edit_task.dart';

class Home_Task extends StatelessWidget {
  Home_Task({super.key});

  final Home_controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text('8'.tr),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 20, 98, 128),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 39, 204, 172),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            Get.off(() => Add_Task(), binding: Binding_add_task());
          },
          child: FaIcon(FontAwesomeIcons.plus)),
      drawer: Drawer_all(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            FutureBuilder(
              future: c.getTask(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: const Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                            color: Colors.white,
                            Icons.wifi_off_outlined,
                            size: 36),
                        SizedBox(height: 20),
                        Text('Please check internet connection',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Tajawal')),
                      ],
                    )),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data['status'] == 'failed') {
                    return const Center(child: Text('NO Tasks'));
                  }
                  if (snapshot.data['status'] == 'sucsees') {
                    return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Slidable(
                              key: ValueKey(0),
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    onPressed: (_) {
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => EdddPage(idb: {
                                          'id': snapshot.data['data'][i]
                                              ['sharedcode'],
                                          'Supoort': snapshot.data['data'][i]
                                              ['Supoort'],
                                          'Date': snapshot.data['data'][i]
                                              ['Date'],
                                          'Target': snapshot.data['data'][i]
                                              ['Target'],
                                          'Team': snapshot.data['data'][i]
                                              ['Team'],
                                          'Destination': snapshot.data['data']
                                              [i]['Destination'],
                                          'Point': snapshot.data['data'][i]
                                              ['Point'],
                                        }),
                                      ));
                                    },
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    foregroundColor:
                                        Color.fromARGB(255, 20, 98, 128),
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    flex: 1,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    onPressed: (_) async {
                                      final pdf = pw.Document();
                                      final supplier = Supplier(
                                          code: snapshot.data['data'][i]['id'],
                                          id: snapshot.data['data'][i]['id'],
                                          date: snapshot.data['data'][i]
                                              ['Date'],
                                          items: snapshot.data['data'][i]
                                              ['Team'],
                                          supoort: snapshot.data['data'][i]
                                              ['Supoort'],
                                          driver: snapshot.data['data'][i]
                                              ['Driver'],
                                          //  logo: Text(''),
                                          city: snapshot.data['data'][i]
                                              ['Destination']);
                                      final pdfFile =
                                          await PdfInvoiceApi.generate(
                                              supplier);
                                      PdfApi.ViewFile(
                                          name: 'مهمة عمل', pdf: pdf);
                                      snapshot.data['data'][i]
                                                      ['administrator'] ==
                                                  1 &&
                                              snapshot.data['data'][i]
                                                      ['security'] ==
                                                  1 &&
                                              snapshot.data['data'][i]['HR'] ==
                                                  1 &&
                                              snapshot.data['data'][i]
                                                      ['Driver'] !=
                                                  ''
                                          ? PdfApi.openFile(pdfFile)
                                          : Get.snackbar('تنبيه',
                                              'يرجى التأكد من استكمال كل المعلومات');
                                    },
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    foregroundColor:
                                        Color.fromARGB(255, 20, 98, 128),
                                    icon: Icons.print,
                                    label: 'Print',
                                  )
                                ],
                              ),
                              child: Card_Task(
                                t: Tasks.fromJson(snapshot.data['data'][i]),
                              ));
                        });
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Center(
                        child: SpinKitFadingFour(
                      size: 32,
                      color: Color.fromARGB(255, 20, 98, 128),
                    )),
                  );
                }
                return Container(
                  child: Center(
                      child: SpinKitFadingFour(
                    size: 32,
                    color: Color.fromARGB(255, 20, 98, 128),
                  )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
*/