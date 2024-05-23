part of 'models.dart';

class Qurban {
  final int idQurban;
  final String nama;
  final String tanggal;
  final String dokumentasi;
  final String deskripsi;
  final String jenisQurban;

  Qurban(
    this.idQurban,
    this.nama,
    this.tanggal,
    this.dokumentasi,
    this.deskripsi,
    this.jenisQurban
  );

  factory Qurban.fromJson(Map<String, dynamic> json){
    return Qurban(
      json['id_qurban'] as int,
      json['nama_orang_berqurban'] as String,
      json['tanggal'] as String,
      json['dokumentasi'] as String,
      json['deskripsi'] as String,
      json['qurban_jenis_id'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_qurban': idQurban,
      'nama_orang_berqurban': nama,
      'tanggal': tanggal,
      'dokumentasi': dokumentasi,
      'deskripsi': deskripsi,
      'qurban_jenis_id': jenisQurban
    };
  }
}