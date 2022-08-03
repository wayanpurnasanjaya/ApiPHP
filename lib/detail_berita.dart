import 'package:flutter/material.dart';
import 'package:apiphp/api.dart';
import 'package:apiphp/res_get_berita.dart';

class DetailBerita extends StatefulWidget {
  const DetailBerita(this.listBerita, {Key? key}) : super(key: key);
  final DataBerita listBerita;
  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}
class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network("$imageUrl${widget.listBerita.foto}"),
            Text(
              widget.listBerita.judul.toString(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.listBerita.isi.toString(),
              textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}