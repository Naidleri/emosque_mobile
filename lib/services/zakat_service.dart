part of 'services.dart';

class ZakatService {
  Future<Zakat> createZakat(CreateNewZakat newZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try {
      final response = await http.post(url,
          headers: ApiHelper.getHeaders(token), body: jsonEncode(newZakat));
      final responseData = ApiHelper.handleResponse(response);
      final newZakatData = Zakat.fromJson(responseData['data']);
      return newZakatData;
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

  Future<Zakat> updateZakat(
      int idZakat, Zakat updatedZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try {
      final response = await http.put(url,
          headers: ApiHelper.getHeaders(token), body: jsonEncode(updatedZakat));
      final responseData = ApiHelper.handleResponse(response);
      final updatedZakatData = Zakat.fromJson(responseData['data']);
      return updatedZakatData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<Zakat> deleteZakat(int idZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try {
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final deletedZakatData = Zakat.fromJson(responseData['data']);
      return deletedZakatData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }
}
