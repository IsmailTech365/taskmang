// ignore_for_file: file_names

import 'dart:io';
import '../constants/url.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup(host);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
