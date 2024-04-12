import 'package:film_arsivi/DatabaseHelper/sql_database.dart';
import 'package:film_arsivi/DatabaseHelper/veritabani_yardimcisi.dart';
import 'package:film_arsivi/model/model_kategori.dart';
import 'package:film_arsivi/tools/my_const.dart';
import 'package:film_arsivi/tools/my_extensions.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VeritabaniYardimcisi.erisim();
    getKategoriler();
  }

  Future<List<ModelKategori>> getKategoriler() async {
    SQLiteDB db = SQLiteDB();
    var liste = await db.tumKategoriler();
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builadAppBar(),
      body: _buildBody(),
      floatingActionButton: _builadKategoriEkleFab(),
    );
  }

  AppBar _builadAppBar() => AppBar(
        title: "Film Arsivi".text.bold.xl3.makeCentered(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      );

  _buildBody() {
    return FutureBuilder(
      future: getKategoriler(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    child: Text(snapshot.data![index].kategori_id.toString())),
                title: Text(snapshot.data![index].kategori_ad.toString()),
              );
            },
          );
        } else {
          return const CircularProgressIndicator().centered();
        }
      },
    );
  }

  FloatingActionButton _builadKategoriEkleFab() {
    return FloatingActionButton(
      onPressed: _kategoriEkle,
      child: const Icon(Icons.add),
    );
  }

  void _kategoriEkle() async {
    String? kategori = await _buildDialog();
    if (kategori != null) {
      SQLiteDB db = SQLiteDB();
      db.addKategori(ModelKategori(kategori_ad: kategori));
      setState(() {});
    }
  }

  Future<String?> _buildDialog() {
    String? sonuc;
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Kategori Ekle"),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              sonuc = value;
            },
            decoration: InputDecoration(
              labelText: "Kategori adı",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
          actions: [
            "İptal".elevatedButton.color(Colors.black).onPressed(() {
              Navigator.pop(context);
            }).make(),
            "Onayla".elevatedButton.color(Colors.black).onPressed(() {
              Navigator.pop(context, sonuc);
            }).make(),
          ],
        );
      },
    );
  }
}
