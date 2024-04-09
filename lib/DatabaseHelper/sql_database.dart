import 'package:film_arsivi/DatabaseHelper/veritabani_yardimcisi.dart';
import 'package:film_arsivi/model/model_kategori.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB {
  late Database db;

  Future<List<ModelKategori>> tumKategoriler() async {
    List<ModelKategori> listeModel = [];
    db = await VeritabaniYardimcisi.erisim();
    List<Map<String, Object?>> liste = await db.query("kategoriler");
    for (var element in liste) {
      listeModel.add(ModelKategori.fromMap(element));
    }
    return listeModel;
  }
}
