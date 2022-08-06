// To parse this JSON data, do
//
//     final resRegister = resRegisterFromJson(jsonString);

import 'dart:convert';

ResRegister resRegisterFromJson(String str) => ResRegister.fromJson(json.decode(str));

String resRegisterToJson(ResRegister data) => json.encode(data.toJson());

class ResRegister {
  ResRegister({
    required this.value,
    required this.message,
  });

  int value;
  String message;

  factory ResRegister.fromJson(Map<String, dynamic> json) => ResRegister(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
