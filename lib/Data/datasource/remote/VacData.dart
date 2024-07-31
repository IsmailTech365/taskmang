// ignore_for_file: file_names

import 'package:nko_flutter/Core/constants/url.dart';
import 'package:nko_flutter/Core/class/crud.dart';
import 'package:nko_flutter/main.dart';

class VacData {
  Crud crud;
  VacData(this.crud);
  getData() async {
    var response = await crud.postData(linkVac_view, {
      'code': shardpref!.get('code'),
    });
    return response.fold((l) => l, (r) => r);
  }
}
