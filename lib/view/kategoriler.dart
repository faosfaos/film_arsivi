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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builadAppBar(),
      body: _buildBody(),
      floatingActionButton: _builadKategoriEkleFab(),
    );
  }

  AppBar _builadAppBar() => AppBar(
        title: "Film Arsivi".text.bold.xl3.makeCentered(),
      );

  _buildBody() {}

  FloatingActionButton _builadKategoriEkleFab() {
    return FloatingActionButton(
      onPressed: _kategoriEkle,
      child: const Icon(Icons.add),
    );
  }

  void _kategoriEkle() async {
    String? kategori = await _buildDialog();
    print(kategori);
  }

  Future<String?> _buildDialog() {
    String? sonuc;
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Kategori Ekle"),
          content: TextField(
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
