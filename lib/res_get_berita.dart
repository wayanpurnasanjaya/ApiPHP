// To parse this JSON data, do
//
//     final resGetBerita = resGetBeritaFromJson(jsonString);

import 'dart:convert';

List<ResGetBerita> resGetBeritaFromJson(String str) => List<ResGetBerita>.from(json.decode(str).map((x) => ResGetBerita.fromJson(x)));

String resGetBeritaToJson(List<ResGetBerita> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResGetBerita {
  ResGetBerita({
    required this.idBerita,
    required this.judul,
    required this.isi,
    required this.foto,
    required this.tglBerita,
  });

  String idBerita;
  String judul;
  String isi;
  String foto;
  String tglBerita;

  factory ResGetBerita.fromJson(Map<String, dynamic> json) => ResGetBerita(
    idBerita: json["id_berita"],
    judul: json["judul"],
    isi: json["isi"],
    foto: json["foto"],
    tglBerita: json["tgl_berita"],
  );

  Map<String, dynamic> toJson() => {
    "id_berita": idBerita,
    "judul": judul,
    "isi": isi,
    "foto": foto,
    "tgl_berita": tglBerita,
  };
}
