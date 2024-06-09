part of 'services.dart';

class LaporanService {
  Future<LaporanKas> createLaporan(LaporanKas newLaporan ,  String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/laporan');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newLaporan.toJson()),
      );
      final responseData = ApiHelper.handleResponse(response);
      final laporanKas = LaporanKas.fromJson(responseData['data']);
      return laporanKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}