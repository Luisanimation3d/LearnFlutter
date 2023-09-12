import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{
  DataModel({
    this.roles = const [],
    this.users = const [],
  });

  List<Rol> roles;
  List<User> users;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    roles: json["roles"] != null
    ? List<Rol>.from(json["roles"].map((x) => Rol.fromJson(x)))
    : [],
    users: json["users"] != null
    ? List<User>.from(json["users"].map((x) => User.fromJson(x)))
    : [],
  );

  Map<String, dynamic> toJson() => {
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class Rol {
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

class User{
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.rol,
  });

  String id;
  String name;
  String email;
  String password;
  String rol;

  factory User.fromJson(Map<String, dynamic> json)=> User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    rol: json["rol"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "rol": rol,
  };
}