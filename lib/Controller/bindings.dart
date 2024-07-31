// ignore_for_file: camel_case_types

import 'package:get/get.dart';
import 'package:nko_flutter/Controller/viewTaskcontroller.dart';
import 'package:nko_flutter/Core/class/crud.dart';
import 'package:nko_flutter/Controller/addTaskcontroller.dart';
import 'package:nko_flutter/Controller/login_controller.dart';
import 'package:nko_flutter/Controller/edit_controller.dart';
import 'package:nko_flutter/Controller/profile_conttroller.dart';
import 'package:nko_flutter/Controller/vac_add_controller.dart';
import 'package:nko_flutter/Controller/viewVaccontroller.dart';

class Binding_profile implements Bindings {
  @override
  void dependencies() {
    Get.put(Profile_controller());
  }
}

class Binding_vac_add implements Bindings {
  @override
  void dependencies() {
    Get.put(Vac_add_controller());
  }
}

class Binding_vac_view implements Bindings {
  @override
  void dependencies() {
    Get.put(VacController());
  }
}

class Binding_edit_task implements Bindings {
  @override
  void dependencies() {
    Get.put(Edit_controller());
  }
}

class Binding_home_task implements Bindings {
  @override
  void dependencies() {
    Get.put(ViewTaskscontroller(), permanent: true);
  }
}

class Binding_login implements Bindings {
  @override
  void dependencies() {
    Get.put(Login_controller());
  }
}

class Binding_add_task implements Bindings {
  @override
  void dependencies() {
    Get.put(Add_controller());
  }
}

class Binding_test implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
