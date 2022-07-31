import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:apiphp/api.dart';
import 'package:http/http.dart' as http;
import 'package:apiphp/detail_berita.dart';
import 'package:apiphp/res_get_berita.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  State<NewsPage> createState() => _NewsPageState();
}
class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;
  List<DataBerita> listBerita = [];
  Future<ResGetBerita?> get_Berita() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response response =
      await http.get(Uri.parse("$baseUrl/get_Berita.php"));
      List<DataBerita>? data = resGetBeritaFromJson(response.body).data;
      setState(() {
        isLoading = false;
        listBerita = data ?? [];
        log("$listBerita");
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
    return null;
  }
  @override
  void initState() {
    super.initState();
    get_Berita();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
        itemCount: listBerita.length,
        itemBuilder: (context, index) {
      DataBerita data = listBerita[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailBerita(
                        listBerita[index],
                      )));
            },
            title: Text(data.judul ?? ""),
            subtitle: Text(data.tgl_berita.toString()),
            leading: Image.network(
              "$imageUrl${data.foto}",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
        ),
      );
        }),
    );
  }
}
