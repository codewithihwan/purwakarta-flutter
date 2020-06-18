class ListWisata {
  List<Wisata> wisata;

  ListWisata({this.wisata});

  ListWisata.fromJson(Map<String, dynamic> json) {
    if (json['wisata'] != null) {
      wisata = new List<Wisata>();
      json['wisata'].forEach((v) {
        wisata.add(new Wisata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wisata != null) {
      data['wisata'] = this.wisata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wisata {
  int id;
  String nama;
  String gambarUrl;
  String kategori;

  Wisata({this.id, this.nama, this.gambarUrl, this.kategori});

  Wisata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambarUrl = json['gambar_url'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['gambar_url'] = this.gambarUrl;
    data['kategori'] = this.kategori;
    return data;
  }
}
