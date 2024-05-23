part of 'services.dart';

class ZakatService {
  Future<Zakat> createZakat (Zakat newZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newZakat)
      );
      final responseData = ApiHelper.handleResponse(response);
      final newZakatData = Zakat.fromJson(responseData['data']);
      return newZakatData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  
}