part of 'providers.dart';

class YayasanZProvider extends ChangeNotifier{
  List<YayasanZakat> _yayasanZakat = [];
  List<YayasanZakat> get yayasanZakat => _yayasanZakat;

  final YayasanZService _yayasanService = YayasanZService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createYayasan(YayasanZakat yayasan, File? image) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _yayasanService.createYayasan(yayasan, image);
      await getAllYayasan();
    } catch (e) {
      throw Exception("Failed to create Yayasan: $e");
    }
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllYayasan () async {
    _isLoading = true;
    notifyListeners();

    try{
      final data = await _yayasanService.getAllYayasan();
      _yayasanZakat = data;
    }catch(e){
      print('Error get all  yayasan penerima zakat: $e');
      throw Exception('Failed to get all  yayasan penerima zakat $e');
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
      print('Error update  yayasan penerima zakat: $e');
      throw Exception('Failed to update  yayasan penerima zakat $e');
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
      print('Error delete  yayasan penerima zakat: $e');
      throw Exception('Failed to delete  yayasan penerima zakat $e');
    }
    _isLoading = false;
    notifyListeners();
  }

}