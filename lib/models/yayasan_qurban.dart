part of 'models.dart';

class YayasanQurban{
  final int idYayasanQurban;
  final String namaYayasan;
  final String tanggal;
  final int rekapanSapi;
  final int rekapanKambing;
  final String gambarSurat;

  YayasanQurban(
    this.idYayasanQurban,
    this.namaYayasan,
    this.tanggal,
    this.rekapanSapi,
    this.rekapanKambing,
    this.gambarSurat,
  );

  factory YayasanQurban.fromJson(Map<String, dynamic> json) {
    return YayasanQurban(
      json['id_yayasan_qurban'] as int,
      json['nama_yayasan'] as String,
      json['tanggal'] as String,
      json['rekapan_sapi'] as int,
      json['rekapan_kambing'] as int ,
      json['gambar_surat'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_yayasan_qurban': idYayasanQurban,
      'nama_yayasan': namaYayasan,
      'tanggal': tanggal,
      'rekapan_sapi': rekapanSapi,
      'rekapan_kambing': rekapanKambing,
      'gambar_surat': gambarSurat
    };
  }
}