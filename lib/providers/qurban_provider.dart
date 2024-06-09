part of 'providers.dart';

class QurbanProvider extends ChangeNotifier {
  List<Qurban> _qurban = [];
  List<Qurban> get qurban => _qurban;

  final QurbanService _qurbanService = QurbanService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createQurban(Qurban newQurban) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _qurbanService.createQurban(newQurban, storedToken!);
    } catch (e) {
      print('Error create qurban: $e');
      throw Exception('Failed to create qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllQurban() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _qurbanService.getAllQurban();
      _qurban = data;
    } catch (e) {
      print('Error get allqurban: $e');
      throw Exception('Failed to get all qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getQurbanById(int idQurban) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _qurbanService.getQurbanById(idQurban, storedToken!);
      _qurban.clear();
      _qurban.add(data);
    } catch (e) {
      print('Error get qurban: $e');
      throw Exception('Failed to get qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateQurban(int idQurban, Qurban updatedQurban) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _qurbanService.updateQurban(
          idQurban, updatedQurban, storedToken!);
    } catch (e) {
      print('Error update qurban: $e');
      throw Exception('Failed to update qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteQurban(int idQurban) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _qurbanService.deleteQurban(idQurban, storedToken!);
    } catch (e) {
      print('Error delete qurban: $e');
      throw Exception('Failed to delete qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
