part of 'services.dart';

class YayasanZService{
   Future<YayasanZakat> createYayasan(YayasanZakat newYayasan , String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-zakat');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newYayasan.toJson()),
      );
      final responseData = ApiHelper.handleResponse(response);
      final yayasanZakat = YayasanZakat.fromJson(responseData['data']);
      return yayasanZakat;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<List<YayasanZakat>> getAllYayasan () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-zakat');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<YayasanZakat> allYayasan = (responseData['data'] as List).map((json) => YayasanZakat.fromJson(json)).toList();
      print(responseData);
      return allYayasan;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> updateYayasan (int idYayasan, YayasanZakat updatedYayasan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-zakat/${idYayasan}');
    try{
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(updatedYayasan)
      );
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<void> deleteYayasan (int idYayasan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-zakat/${idYayasan}');
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