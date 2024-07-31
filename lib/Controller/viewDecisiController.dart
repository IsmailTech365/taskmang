// ignore_for_file: file_names

import 'package:get/get.dart';
import '../Core/class/statusrequest.dart';
import '../Core/function/handlingData.dart';
import '../Data/datasource/remote/decision.dart';

class DecisionsController extends GetxController {
  Decisions testDecisions = Decisions(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getDecisions() async {
    statusRequest = StatusRequest.loding;
    var response = await testDecisions.getDecisions();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getDecisions();
    super.onInit();
  }
}
