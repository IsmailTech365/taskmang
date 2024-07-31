// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:nko_flutter/Data/datasource/remote/VacData.dart';
import '../Core/class/statusrequest.dart';
import '../Core/function/handlingData.dart';

class VacController extends GetxController {
  VacData testData = VacData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
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
