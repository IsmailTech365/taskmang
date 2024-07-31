// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, depend_on_referenced_packages

import 'dart:convert';
import 'package:nko_flutter/Core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';
import 'package:nko_flutter/Core/function/internetCheck.dart';
import 'package:http/http.dart' as http;

///////////////// headers من اجل موضوع تأمين APi///////////////////////////
String _basicAuth = 'Basic ' + base64Encode(utf8.encode('ismail:ismail365'));
Map<String, String> myheaders = {'authorization': _basicAuth};

////////////////////////////////////////////////////////////////////////////
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
