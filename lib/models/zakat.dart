part of 'models.dart';

class Zakat {
  final int idZakat;
  final String namaPezakat;
  final int jumlahZakat;
  final int jenisZakatId;
  final String namaJenisZakat;

  Zakat(
    this.idZakat,
    this.namaPezakat,
    this.jumlahZakat,
    this.jenisZakatId,
    this.namaJenisZakat,
  );

  factory Zakat.fromJson(Map<String, dynamic> json) {
    return Zakat(
        json['id_zakatfitrah'] as int,
        json['nama_pezakat'] as String,
        json['jumlah_zakat'] as int,
        json['zakat_jenis_id'] as int,
        json['nama_jenis_zakat'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_zakatfitrah': idZakat,
      'nama_pezakat': namaPezakat,
      'jumlah_zakat': jumlahZakat,
      'zakat_jenis_id': jenisZakatId,
      'nama_jenis_zakat': namaJenisZakat
    };
  }
}
