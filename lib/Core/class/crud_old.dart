// ignore_for_file: avoid_print, unused_local_variable, unused_import, depend_on_referenced_packages, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

///////////////// headers من اجل موضوع تأمين APi///////////////////////////

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('ismail:ismail365'));
Map<String, String> myheaders = {'authorization': _basicAuth};

////////////////////////////////////////////////////////////////////////////
class Crud {
  getrequest(String uri) async {
    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print('error ${response.statusCode}');
      }
    } catch (e) {
      print('error catch $e');
    }
  }

  postrequest(String uri, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(uri), body: data, headers: myheaders);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print('error ${response.statusCode}');
      }
    } catch (e) {
      print('error catch $e');
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var length = await file.length();

    var stream = http.ByteStream(file.openRead());

    var multipartFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multipartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);

    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error ${myrequest.statusCode}");
    }
  }
}
