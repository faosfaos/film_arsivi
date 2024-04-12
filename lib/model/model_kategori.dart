class ModelKategori {
  int? kategori_id;
  String? kategori_ad;

  ModelKategori({this.kategori_id, this.kategori_ad});

  factory ModelKategori.fromMap1(Map<String, dynamic> json) {
    return ModelKategori(
        kategori_id: json["kategori_id"], kategori_ad: json["kategori_ad"]);
  }

  ModelKategori.fromMap2(Map<String, dynamic> json) {
    kategori_id = json['kategori_id'];
    kategori_ad = json['kategori_ad'];
  }
  ModelKategori.fromMap3(Map<String, dynamic> json)
      : kategori_id = json['kategori_id'],
        kategori_ad = json['kategori_ad'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kategori_id'] = kategori_id;
    data['kategori_ad'] = kategori_ad;
    return data;
  }
}
