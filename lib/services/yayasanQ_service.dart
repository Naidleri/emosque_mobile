part of 'services.dart';

class YayasanQService {
  Future<void> createYayasan(YayasanQurban yayasan, File? image) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-qurban');
    var request = http.MultipartRequest('POST', url);

    request.fields['nama_yayasan'] = yayasan.namaYayasan;
    request.fields['tanggal'] = yayasan.tanggal;
    request.fields['rekapan_kambing'] = yayasan.rekapanKambing.toString();
    request.fields['rekapan_sapi'] = yayasan.rekapanSapi.toString();

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'gambar_surat',
        image.path,
      ));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      print("Yayasan created successfully");
    } else {
      print("Failed to create Yayasan");
      throw Exception("Failed to create Yayasan");
    }
  }

  Future<List<YayasanQurban>> getAllYayasan() async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-qurban');
    try {
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final List<YayasanQurban> allYayasan = (responseData['data'] as List)
          .map((json) => YayasanQurban.fromJson(json))
          .toList();
      print(responseData);
      return allYayasan;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> updateYayasan(
      int idYayasan, YayasanZakat updatedYayasan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-qurban${idYayasan}');
    try {
      final response = await http.put(url,
          headers: ApiHelper.getHeaders(token),
          body: jsonEncode(updatedYayasan));
      final responseData = ApiHelper.handleResponse(response);
      return responseData;
    } catch (e) {
      return ApiHelper.handleError(e);
    }
  }

  Future<void> deleteYayasan(int idYayasan, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/yayasan-qurban/${idYayasan}');
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
