import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.roles
  });
  
  List<Rol> roles;

  factory DataModel.fromJson(Map<String, dynamic> json)=> DataModel(
    roles: List<Rol>.from(json["roles"].map((x)=> Rol.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "roles": List<dynamic>.from(roles.map((x)=> x.toJson()))
  };
}

class Rol{
  Rol({
    required this.id,
    required this.name,
    required this.state,
    required this.permissions
  });

  String id;
  String name;
  bool state;
  List permissions;

  factory Rol.fromJson(Map<String, dynamic> json)=> Rol(
    id: json["_id"],
    name: json["name"],
    state: json["state"],
    permissions: List<String>.from(json["permissions"].map((x)=> x))
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "state": state,
    "permissions": List<dynamic>.from(permissions.map((x)=> x))
  };

}