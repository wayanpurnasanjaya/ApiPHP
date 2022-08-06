import 'dart:convert';
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
// class _NewsPageState extends State<NewsPage> {
// bool isLoading = false;
// List<DataBerita> listBerita = [];
// Future<ResGetBerita?> get_Berita() async {
//   try {
//     setState(() {
//       isLoading = true;
//     });
//     http.Response response =
//     await http.get(Uri.parse());
//     List<DataBerita>? data = resGetBeritaFromJson(response.body).data;
//     setState(() {
//       isLoading = false;
//       listBerita = data ?? [];
//       log("$listBerita");
//     });
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     });
//   }
//   return null;
// }
// @override
// void initState() {
//   super.initState();
//   get_Berita();
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: ListView.builder(
//       itemCount: listBerita.length,
//       itemBuilder: (context, index) {
//     DataBerita data = listBerita[index];
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         child: ListTile(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => DetailBerita(
//                       listBerita[index],
//                     )));
//           },
//           title: Text(data.judul ?? ""),
//           subtitle: Text(data.tgl_berita.toString()),
//           leading: Image.network(
//             "$imageUrl${data.foto}",
//             fit: BoxFit.cover,
//             height: 100,
//             width: 100,
//           ),
//         ),
//       ),
//     );
//       }),
//   );
// }
// }


class _NewsPageState extends State<NewsPage> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("$baseUrl/get_berita.php"));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apps Berita'),
          backgroundColor: Colors.brown,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ItemList(list: snapshot.data!)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailBerita(listBerita: list, index: index,);
          }));

            },
            child: Card(
              child: ListTile(
                title: Text(
                  list[index]['judul'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.brown),
                ),
                subtitle: Text("Tanggal : ${list[index]['tgl_berita']}"),
                trailing: Image.network(
                  'https://meblanjo.000webhostapp.com/images/' + list[index]['foto'],
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}