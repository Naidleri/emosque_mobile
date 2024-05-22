part of 'models.dart';

class SaldoKas {
  final int idSaldoKas;
  final String tanggal;
  final int saldoMasuk;
  final int saldoKeluar;
  final bool approval;
  final int kasJenisId;

  SaldoKas(
    this.idSaldoKas,
    this.tanggal,
    this.saldoMasuk,
    this.saldoKeluar,
    this.approval,
    this.kasJenisId,
  );

  factory SaldoKas.fromJson(Map<String, dynamic> json) {
    return SaldoKas(
      json['id_saldo_kas'] as int,
      json['tanggal'] as String,
      json['saldo_masuk'] as int,
      json['saldo_keluar'] as int,
      json['approval'] as bool,
      json['kas_jenis_id'] as int,
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_saldo_kas': idSaldoKas,
      'tanggal': tanggal,
      'saldo_masuk': saldoMasuk,
      'saldo_keluar': saldoKeluar,
      'approval': approval,
      'kas_jenis_id': kasJenisId
    };
  }
}
