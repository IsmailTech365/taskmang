// ignore_for_file: file_names

import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/Core/class/crud.dart';
import 'package:nko_flutter/main.dart';

class TaskData {
  Crud crud;
  TaskData(this.crud);
  getData() async {
    var response = await crud.postData(linkview, {
      'code': shardpref!.get('code'),
    });
    return response.fold((l) => l, (r) => r);
  }
}
