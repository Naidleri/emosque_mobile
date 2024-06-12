part of 'providers.dart';

class YayasanQProvider extends ChangeNotifier{
  List<YayasanQurban> _yayasanQurban = [];
  List<YayasanQurban> get yayasanQurban => _yayasanQurban;

  final YayasanQService _yayasanService = YayasanQService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createYayasan(YayasanQurban yayasan, File? image) async {
    try {
      await _yayasanService.createYayasan(yayasan, image);
      notifyListeners();  // Notify listeners after successful creation
    } catch (e) {
      throw Exception("Failed to create Yayasan: $e");
    }
  }

  Future<void> getAllYayasan () async {
    _isLoading = true;
    notifyListeners();

    try{
      final data = await _yayasanService.getAllYayasan();
      _yayasanQurban = data;
    }catch(e){
      print('Error get all  yayasan penerima qurban: $e');
      throw Exception('Failed to get all  yayasan penerima qurban $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateYayasan (int idYayasan, YayasanZakat updatedYayasan) async {
    _isLoading = true;
    notifyListeners();

    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _yayasanService.updateYayasan(idYayasan, updatedYayasan, storedToken!);
    }catch(e){
      print('Error update  yayasan penerima qurban $e');
      throw Exception('Failed to update  yayasan penerima qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteYayasan (int idYayasan) async {
    _isLoading = true;
    notifyListeners();

    try{
      final storedToken = await _secureStorage.read(key: 'token');
      await _yayasanService.deleteYayasan(idYayasan, storedToken!);
      await getAllYayasan();
    }catch(e){
      print('Error delete  yayasan penerima qurban: $e');
      throw Exception('Failed to delete  yayasan penerima qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

}