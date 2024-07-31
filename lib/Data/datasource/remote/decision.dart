// ignore_for_file: file_names

import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/Core/class/crud.dart';

class Decisions {
  Crud crud;
  Decisions(this.crud);
  getDecisions() async {
    var response = await crud.postData(decisionsView, {});
    return response.fold((l) => l, (r) => r);
  }
}
