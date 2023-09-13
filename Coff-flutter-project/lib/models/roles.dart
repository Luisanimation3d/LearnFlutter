import 'dart:convert';

DataModelRol dataModelFromJson(String str) => DataModelRol.fromJson(json.decode(str));

String dataModelToJson(DataModelRol data) => json.encode(data.toJson());



class DataModelRol {
  DataModelRol({
    required this.roles
  });
  
  List<Rol> roles;

  factory DataModelRol.fromJson(Map<String, dynamic> json)=> DataModelRol(
    roles: List<Rol>.from(json["roles"].map((x)=> Rol.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "roles": List<dynamic>.from(roles.map((x)=> x.toJson()))
  };
}

class Rol {
  final String id;
  String name;
  bool state;
  List permissions;

  Rol({
    required this.id,
    required this.name,
    required this.state,
    required this.permissions,
  });

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["_id"],
        name: json["name"],
        state: json["state"],
        permissions: json["permissions"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "state": state,
        "permissions": permissions,
      };
}