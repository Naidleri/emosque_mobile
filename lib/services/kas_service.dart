part of 'services.dart';

class KasService {
  
  Future<SaldoKas> createKas(SaldoKas newKas ,  String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newKas),
      );
      final responseData = ApiHelper.handleResponse(response);
      final saldoKas = SaldoKas.fromJson(responseData['data']);
      return saldoKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<SaldoKas> getAllKas () async {
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final allKas = SaldoKas.fromJson(responseData['data']);
      return allKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }

  }
}