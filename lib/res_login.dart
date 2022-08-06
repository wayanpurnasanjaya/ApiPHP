// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
  ResLogin({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.idUser,
  });

  int value;
  String message;
  String username;
  String nama;
  String idUser;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    nama: json["nama"],
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "nama": nama,
    "id_user": idUser,
  };
}
