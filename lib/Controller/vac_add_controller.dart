// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_null_comparison, depend_on_referenced_packages, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nko_flutter/View/Vacations/view_vac.dart';
import '../Core/class/crud_old.dart';
import '../Core/constants/url.dart';
import '../main.dart';

class DateSelectionModel {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
}

class Vac_add_controller extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool allFieldsFilled = false.obs;
  DateTime date = DateTime.now();
  Crud crud = Crud();
  TextEditingController startDateController = TextEditingController();
  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  RxInt selected_type_vac = 1.obs;
  RxInt selectedTimeVac = 1.obs;
  RxInt selectedProidVac = 1.obs;

  void updateSelectedStartDate(DateTime? pickedDate) {
    selectedStartDate.value = pickedDate;
    startDateController.text = pickedDate != null
        ? "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}"
        : '';
  }

  void checkFields() {
    allFieldsFilled.value = startDateController.text.isNotEmpty;
  }

  void initUser() {
    startDateController = TextEditingController();
    startDateController.addListener(checkFields);
  }

  RxBool type2 = false.obs;
  RxBool start = false.obs;
  RxBool steppstate = false.obs;
  RxInt currentStep = 0.obs;
  void onStepContinue() {
    if (currentStep.value < 4) {
      currentStep.value == 2
          ? selectedTimeVac.value == 1
              ? currentStep.value = currentStep.value + 1
              : currentStep.value = currentStep.value + 2
          : currentStep.value = currentStep.value + 1;

      steppstate = true.obs;
    } else if (currentStep < 5) {
      if (formkey.currentState!.validate()) {
        currentStep.value = currentStep.value + 1;
      } else {
        currentStep.value = currentStep.value;
      }
    } else {
      add_vac();
      currentStep.value = 0;
      // selected_type_vac = 0.obs;
      // selectedTimeVac = 0.obs;
      // selectedProidVac = 0.obs;
      startDateController.clear();
      Get.off(() => const View_Vac());
    }
  }

  void onStepCancel() {
    if (currentStep.value > 0) {
      currentStep.value == 4
          ? selectedTimeVac.value == 1
              ? currentStep.value = currentStep.value - 1
              : currentStep.value = currentStep.value - 2
          : currentStep.value = currentStep.value - 1;
    } else {
      currentStep.value = 0;
    }
  }

  void onStepTapped(int step) {
    currentStep.value = step;
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('Next'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }

  add_vac() async {
    var respose = await crud.postrequest(linkVac_add, {
      'code': shardpref!.get('code'),
      'num_vac': '',
      'name': shardpref!.get('name'),
      'departement': shardpref!.get('depart'),
      'position': 'Data entry',
      'type_vac': (selected_type_vac == 1)
          ? "اجازة اعتيادية"
          : (selected_type_vac == 2)
              ? "اجازة مرضية"
              : (selected_type_vac == 3)
                  ? "اجازة بلا أجر"
                  : "",
      'time': (selectedTimeVac == 1)
          ? "نصف يوم"
          : (selectedTimeVac == 2)
              ? "يوم واحد"
              : (selectedTimeVac == 3)
                  ? "يومان"
                  : "",
      'Period': selectedTimeVac == 1
          ? (selectedProidVac == 1)
              ? "الفترة الصباحية"
              : (selectedProidVac == 2)
                  ? "الفترة المسائية"
                  : ""
          : "",
      'date_vac': startDateController.text,
    });
    return respose;
  }

  @override
  void onInit() {
    initUser();
    super.onInit();
  }
}
