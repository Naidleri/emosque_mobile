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

  Future<List<LaporanKas>> getAllLaporan () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/laporan');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<LaporanKas> allLaporan = (responseData['data'] as List).map((json) => LaporanKas.fromJson(json)).toList();
      print(responseData);
      return allLaporan;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> approveLaporan(int idLaporan ,  String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/laporan/$idLaporan?approval=true');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
      );
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> rejectLaporan(int idLaporan , String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/laporan/$idLaporan?approval=false');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
      );
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}