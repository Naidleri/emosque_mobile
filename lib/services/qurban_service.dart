part of 'services.dart';

class QurbanService {
  Future<Qurban> createQurban (Qurban newQurban, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/qurban');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newQurban)
      );
      final responseData = ApiHelper.handleResponse(response);
      final newQurbanData = Qurban.fromJson(responseData['data']);
      return newQurbanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}