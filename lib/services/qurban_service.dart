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

  Future<List<Qurban>> getAllQurban () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/qurban');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<Qurban> allQurbanData = (responseData['data'] as List).map((json) => Qurban.fromJson(json)).toList();
      print(responseData['data']);
      return allQurbanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Qurban> getQurbanById (int idQurban, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/qurban/$idQurban');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final qurbanData = Qurban.fromJson(responseData['data']);
      return qurbanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Qurban> updateQurban (int idQurban, Qurban updatedQurban, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/qurban/$idQurban');
    try{
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(updatedQurban)
      );
      final responseData = ApiHelper.handleResponse(response);
      final updatedQurbanData = Qurban.fromJson(responseData['data']);
      return updatedQurbanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Qurban> deleteQurban (int idQurban, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/qurban/$idQurban');
    try{
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final deletedQurbanData = Qurban.fromJson(responseData['data']);
      return deletedQurbanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}