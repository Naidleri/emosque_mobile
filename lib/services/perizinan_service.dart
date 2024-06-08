part of 'services.dart';

class PerizinanService {
  Future<Perizinan> createPerizinan (Perizinan newPerizinan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/perizinan');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newPerizinan.toJson())
      );
      final responseData = ApiHelper.handleResponse(response);
      final newPerizinanData = Perizinan.fromJson(responseData['data']);
      return newPerizinanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<List<Perizinan>> getAllPerizinan () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/perizinan');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<Perizinan> allPerizinanData = (responseData['data'] as List).map((json) => Perizinan.fromJson(json)).toList();
      print(responseData['data']);
      return allPerizinanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Perizinan> deletePerizinan (int idPerizinan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/perizinan/$idPerizinan');
    try{
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final deletedPerizinanData = Perizinan.fromJson(responseData['data']);
      return deletedPerizinanData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}