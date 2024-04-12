import 'package:film_arsivi/DatabaseHelper/veritabani_yardimcisi.dart';
import 'package:film_arsivi/model/model_kategori.dart';
import 'package:film_arsivi/tools/my_const.dart';
import 'package:film_arsivi/tools/my_extensions.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB {
  late Database db;

  Future<List<ModelKategori>> tumKategoriler() async {
    //List<ModelKategori> listeModel = [];
    db = await VeritabaniYardimcisi.erisim();
    var map = await db.rawQuery("Select * from ${Table.kategoriler}");
    /*for (var element in liste) {
      listeModel.add(ModelKategori.fromMap2(element));
    }*/
    //return listeModel;
    return List.generate(map.length, (index) {
      var satir = map[index];
      var k = ModelKategori(
          kategori_ad: satir["kategori_ad"].toString(),
          kategori_id: int.parse(satir["kategori_id"].toString()));
      return k;
    });
  }

  void addKategori(ModelKategori kategori) async {
    db = await VeritabaniYardimcisi.erisim();
    db.insert(Table.kategoriler, kategori.toMap());
  }
}
