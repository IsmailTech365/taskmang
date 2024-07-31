// ignore_for_file: prefer_collection_literals, unnecessary_new

class UserModel {
  int? id;
  String? name;
  String? departement;
  String? position;
  String? password;
  String? imageName;

  UserModel({
    this.id,
    this.name,
    this.departement,
    this.position,
    this.password,
    this.imageName,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    departement = json['Departement'];
    position = json['Position'];
    password = json['Password'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Name'] = name;
    data['Departement'] = departement;
    data['Position'] = position;
    data['Password'] = password;
    data['image_name'] = imageName;
    return data;
  }
}
