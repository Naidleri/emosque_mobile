part of 'models.dart';

class LaporanKas{
  final int idLaporan;
  final String judul;
  final String tanggal;
  final int saldoMasuk;
  final int saldoKeluar;
  final int totalSaldo;
  final String deskripsi;
  final bool persetujuan;
  final String catatan;

  LaporanKas(
    this.idLaporan,
    this.judul,
    this.tanggal,
    this.saldoMasuk,
    this.saldoKeluar,
    this.totalSaldo,
    this.deskripsi,
    this.persetujuan,
    this.catatan
  );

  factory LaporanKas.fromJson(Map<String, dynamic> json) {
    return LaporanKas(
      json['id_laporan'] as int,
      json['judul'] as String,
      json['tanggal'] as String,
      json['saldo_masuk'] as int,
      json['saldo_keluar'] as int,
      json['total_saldo'] as int,
      json['deskripsi'] as String,
      json['persetujuan'] ?? false,
      json['catatan'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_laporan': idLaporan,
      'judul': judul,
      'tanggal': tanggal,
      'saldo_masuk': saldoMasuk,
      'saldo_keluar': saldoKeluar,
      'total_saldo': totalSaldo,
      'deskripsi': deskripsi,
      'persetujuan': persetujuan,
      'catatan': catatan
    };
  }
}