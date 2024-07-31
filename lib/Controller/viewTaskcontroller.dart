// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unused_local_variable, unused_element, prefer_final_fields, avoid_unnecessary_containers

// import 'package:get/get.dart';
// import 'package:nko_flutter/Constants/Tools/url.dart';
// import '../Constants/Tools/crud.dart';
// import '../main.dart';

// ignore_for_file: camel_case_types, file_names

// class Home_controller extends GetxController {
//   Crud _crud = Crud();
//   getTask() async {
//     var response = await _crud.postrequest(linkview, {
//       'code': shardpref!.get('code'),
//     });
//     return response;
//   }
// }
import 'package:get/get.dart';
import 'package:nko_flutter/Core/class/statusrequest.dart';
import 'package:nko_flutter/Core/function/handlingData.dart';
import 'package:nko_flutter/Core/services/pdf_api.dart';
import 'package:nko_flutter/Data/Model/tasks.dart';
import 'package:nko_flutter/Data/datasource/remote/TaskData.dart';
import 'package:nko_flutter/View/Task/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ViewTaskscontroller extends GetxController {
  TaskData testData = TaskData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  pdfTask(Tasks task) async {
    final pdf = pw.Document();
    final supplier = Supplier(t: task);
    final pdfFile = await PdfInvoiceApi.generate(supplier);
    PdfApi.ViewFile(name: 'مهمة عمل', pdf: pdf);
    // controller.checkTask()
    //     ?
    PdfApi.openFile(pdfFile);
    // : Get.snackbar(
    //     'تنبيه', 'يرجى التأكد من استكمال كل المعلومات');
    if (task.administrator == 1 &&
        task.security == 1 &&
        task.hR == 1 &&
        task.driver != '') {
      return true;
    } else {
      return false;
    }
  }

  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}


// <?php 
// include "../connect/connect.php";

// $alldata =array();

// $alldata['status']='success';
// $task = getAllData('tasks_data',null,null,false);
// $alldata['data']=$task;
// echo json_encode($alldata);