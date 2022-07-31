import 'dart:convert';

ResGetBerita resGetBeritaFromJson(String str) => ResGetBerita.fromJson(json.decode(str));
String resGetBeritaToJson(ResGetBerita data) => json.encode(data.toJson());
class ResGetBerita {
  ResGetBerita({
    this.isSucces,
    this.message,
    this.data,
  });
  bool? isSucces;
  String? message;
  List<DataBerita>? data;
  factory ResGetBerita.fromJson(Map<String, dynamic> json) => ResGetBerita(
    isSucces: json["is_succes"],
    message: json["message"],
    data: json["data"] == null
        ? null
        : List<DataBerita>.from(
        json["data"].map((x) => DataBerita.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "is_succes": isSucces,
    "message": message,
    "data": data == null
        ? null
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
class DataBerita {
  DataBerita({
    this.id,
    this.judul,
    this.isi,
    this.foto,
    this.tgl_berita,
  });
  String? id;
  String? judul;
  String? isi;
  String? foto;
  DateTime? tgl_berita;
  factory DataBerita.fromJson(Map<String, dynamic> json) => DataBerita(
    id: json["id"],
    judul: json["judul"],
    isi: json["isi"],
    foto: json["foto"],
    tgl_berita: json["tgl_berita"] == null
        ? null
        : DateTime.parse(json["tgl_berita"]),
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "isi": isi,
    "foto": foto,
// ignore: prefer_null_aware_operators
    "tgl_berita": tgl_berita == null ? null : tgl_berita?.toIso8601String(),
  };
}