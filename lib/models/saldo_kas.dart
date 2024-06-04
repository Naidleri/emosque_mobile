part of 'models.dart';

class SaldoKas {
  final int idSaldoKas;
  final String judul;
  final String jenis;
  final String tanggal;
  final int nominal;
  final String deskripsi;

  SaldoKas(
    this.idSaldoKas,
    this.judul,
    this.jenis,
    this.tanggal,
    this.nominal,
    this.deskripsi,
  );

  factory SaldoKas.fromJson(Map<String, dynamic> json) {
    return SaldoKas(
      json['id_transaksi'] as int,
      json['judul'] as String,
      json['jenis'] as String,
      json['tanggal'] as String,
      json['nominal'] as int ,
      json['deskripsi'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_transaksi': idSaldoKas,
      'judul': judul,
      'jenis': jenis,
      'tanggal': tanggal,
      'nominal': nominal,
      'deskripsi': deskripsi
    };
  }
}
