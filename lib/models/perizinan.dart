part of 'models.dart';

class Perizinan{
  final int idDetailPerizinan;
  final String namaPengaju;
  final String tanggal;
  final String deskripsi;
  final int perizinanId;
  final int pjId;
  final String namaPerizinan;
  final String namaPJ;

  Perizinan(
    this.idDetailPerizinan,
    this.namaPengaju,
    this.tanggal,
    this.deskripsi,
    this.perizinanId,
    this.pjId,
    this.namaPerizinan,
    this.namaPJ
  );

  factory Perizinan.fromJson(Map<String, dynamic> json) {
    return Perizinan(
      json['id_detail_perizinan'] as int,
      json['nama_pengaju'] as String,
      json['tgl_kegiatan'] as String,
      json['deskripsi'] as String,
      json['perizinan_id'] as int,
      json['pj_id'] as int,
      json['nama_perizinan'] as String,
      json['nama_pj'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_detail_perizinan': idDetailPerizinan,
      'nama_pengaju': namaPengaju,
      'tgl_kegiatan': tanggal,
      'deskripsi': deskripsi,
      'perizinan_id': perizinanId,
      'pj_id': pjId,
      'nama_perizinan': namaPerizinan,
      'nama_pj': namaPJ
    };
  }
}