part of 'services.dart';

class KasService {
  
  Future<SaldoKas> createKas(SaldoKas newKas ,  String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newKas.toJson()),
      );
      final responseData = ApiHelper.handleResponse(response);
      final saldoKas = SaldoKas.fromJson(responseData['data']);
      return saldoKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<List<SaldoKas>> getAllKas () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<SaldoKas> allKas = (responseData['data'] as List).map((json) => SaldoKas.fromJson(json)).toList();
      print(responseData);
      return allKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> updateKas (int idKas, SaldoKas updatedKas, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas/${idKas}');
    try{
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(updatedKas)
      );
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> deleteKas (int idKas, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas/${idKas}');
    try{
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}