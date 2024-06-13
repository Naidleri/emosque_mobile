part of 'services.dart';

class ZakatService {
  Future<void> createZakat(CreateZakat newZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try {
      final response = await http.post(url,
          headers: ApiHelper.getHeaders(token), body: jsonEncode(newZakat));
      final responseData = ApiHelper.handleResponse(response);
      
      return responseData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<List<Zakat>> getAllZakat() async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try {
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<Zakat> allZakatData = (responseData['data'] as List)
          .map((json) => Zakat.fromJson(json))
          .toList();
      return allZakatData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<Zakat> getZakatById(int idZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try {
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final zakatData = Zakat.fromJson(responseData['data']);
      return zakatData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> updateZakat(
      int idZakat, CreateZakat updatedZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try {
      final response = await http.put(url,
          headers: ApiHelper.getHeaders(token), body: jsonEncode(updatedZakat));
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> deleteZakat(int idZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try {
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }
}
