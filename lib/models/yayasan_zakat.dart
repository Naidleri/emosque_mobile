part of 'models.dart';

class YayasanZakat{
  final int idYayasanZakat;
  final String namaYayasan;
  final String tanggal;
  final int rekapanUang;
  final int rekapanBeras;
  final String gambarSurat;

  YayasanZakat(
    this.idYayasanZakat,
    this.namaYayasan,
    this.tanggal,
    this.rekapanUang,
    this.rekapanBeras,
    this.gambarSurat,
  );

  factory YayasanZakat.fromJson(Map<String, dynamic> json) {
    return YayasanZakat(
      json['id_yayasan_zakat'] as int,
      json['nama_yayasan'] as String,
      json['tanggal'] as String,
      json['rekapan_uang'] as int,
      json['rekapan_beras'] as int ,
      json['gambar_surat'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_yayasan_zakat': idYayasanZakat,
      'nama_yayasan': namaYayasan,
      'tanggal': tanggal,
      'rekapan_uang': rekapanUang,
      'rekapan_beras': rekapanBeras,
      'gambar_surat': gambarSurat
    };
  }
}