part of 'providers.dart';

class ZakatProvider extends ChangeNotifier {
  List<Zakat> _zakatFitrah = [];
  List<Zakat> get zakatFitrah => _zakatFitrah;

  final ZakatService _zakatService = ZakatService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createZakat(CreateNewZakat newZakat) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _zakatService.createZakat(newZakat, storedToken!);
    } catch (e) {
      print('Error create zakat fitrah: $e');
      throw Exception('Failed to create zakat fitrah $e');
    }
    _isLoading = true;
    notifyListeners();
  }

  Future<void> getAllZakat() async {
    _isLoading = true;
    notifyListeners();
    try {
      // final storedToken = await _secureStorage.read(key: 'token');
      final data = await _zakatService.getAllZakat();
      _zakatFitrah = data;
    } catch (e) {
      print('Error get all zakat fitrah: $e');
      throw Exception('Failed to get all zakat fitrah $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getZakatById(int idZakat) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _zakatService.getZakatById(idZakat, storedToken!);
      _zakatFitrah.add(data);
    } catch (e) {
      print('Error get zakat fitrah: $e');
      throw Exception('Failed to get zakat fitrah $e');
    }
    _isLoading = true;
    notifyListeners();
  }

  Future<void> updateZakat(int idZakat, Zakat updatedZakat) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data =
          await _zakatService.updateZakat(idZakat, updatedZakat, storedToken!);
    } catch (e) {
      print('Error update zakat fitrah: $e');
      throw Exception('Failed to update zakat fitrah $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteZakat(int idZakat) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _zakatService.deleteZakat(idZakat, storedToken!);
    } catch (e) {
      print('Error delete zakat fitrah: $e');
      throw Exception('Failed to delete zakat fitrah $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
