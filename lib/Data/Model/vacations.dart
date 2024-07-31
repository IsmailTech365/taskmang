// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

import 'dart:convert';

class Vacations {
  int? id;
  int? code;
  int? numVac;
  String? name;
  String? departement;
  String? position;
  String? typeVac;
  String? time;
  String? period;
  String? dateVac;
  int? approval;

  Vacations(
      {this.id,
      this.code,
      this.numVac,
      this.name,
      this.departement,
      this.position,
      this.typeVac,
      this.time,
      this.period,
      this.dateVac,
      this.approval});

  Vacations.fromJson(Map<String, dynamic> json) {
    id = jsonDecode(json['id']);
    code = jsonDecode(json['code']);
    numVac = jsonDecode(json['num_vac']);
    name = json['name'];
    departement = json['departement'];
    position = json['position'];
    typeVac = json['type_vac'];
    time = json['time'];
    period = json['Period'];
    dateVac = json['date_vac'];
    approval = jsonDecode(json['approval']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['num_vac'] = this.numVac;
    data['name'] = this.name;
    data['departement'] = this.departement;
    data['position'] = this.position;
    data['type_vac'] = this.typeVac;
    data['time'] = this.time;
    data['Period'] = this.period;
    data['date_vac'] = this.dateVac;
    data['approval'] = this.approval;
    return data;
  }
}
