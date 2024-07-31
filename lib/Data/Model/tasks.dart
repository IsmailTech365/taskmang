// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

import 'dart:convert';

class Tasks {
  int? id;
  int? code;

  String? name;
  String? department;
  String? date;
  String? target;
  String? destination;
  String? team;
  String? supoort;
  String? point;
  String? driver;
  int? security;
  int? administrator;
  int? hR;

  Tasks(
      {this.id,
      this.code,
      this.name,
      this.department,
      this.date,
      this.target,
      this.destination,
      this.team,
      this.supoort,
      this.point,
      this.driver,
      this.security,
      this.administrator,
      this.hR});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = jsonDecode(json['id']);
    code = jsonDecode(json['code']);

    name = json['Name'];
    department = json['Department'];
    date = json['Date'];
    target = json['Target'];
    destination = json['Destination'];
    team = json['Team'];
    supoort = json['Supoort'];
    point = json['Point'];
    driver = json['Driver'];
    security = jsonDecode(json['security']);
    administrator = jsonDecode(json['administrator']);
    hR = jsonDecode(json['HR']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;

    data['Name'] = this.name;
    data['Department'] = this.department;
    data['Date'] = this.date;
    data['Target'] = this.target;
    data['Destination'] = this.destination;
    data['Team'] = this.team;
    data['Supoort'] = this.supoort;
    data['Point'] = this.point;
    data['Driver'] = this.driver;
    data['security'] = this.security;
    data['administrator'] = this.administrator;
    data['HR'] = this.hR;
    return data;
  }
}
