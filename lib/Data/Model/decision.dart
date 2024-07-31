// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, camel_case_types

import 'dart:convert';

class Decisions {
  int? id;
  int? numdecisions;
  String? date;
  String? title;

  Decisions({this.id, this.numdecisions, this.date, this.title});

  Decisions.fromJson(Map<String, dynamic> json) {
    id = jsonDecode(json['id']);
    numdecisions = jsonDecode(json['numdecisions']);
    date = json['date'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numdecisions'] = this.numdecisions;
    data['date'] = this.date;
    data['title'] = this.title;
    return data;
  }
}
