import 'package:flutter/material.dart';
import 'package:apiphp/api.dart';
import 'package:apiphp/res_get_berita.dart';

class DetailBerita extends StatefulWidget {

  final List listBerita;
  int index;
  DetailBerita({required this.listBerita, required this.index});
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
            Image.network("https://meblanjo.000webhostapp.com/images/${widget.listBerita[widget.index]['foto']}"),
            Text(
              widget.listBerita[widget.index]['judul'],
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.listBerita[widget.index]['isi'],
              textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}