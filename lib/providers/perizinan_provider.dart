part of 'providers.dart';

class PerizinanProvider extends ChangeNotifier {
  List<Perizinan> _perizinan = [];
  List<Perizinan> get perizinan => _perizinan;

  final PerizinanService _perizinanService = PerizinanService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createPerizinan(Perizinan newPerizinan) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');
      await _perizinanService.createPerizinan(newPerizinan, storedToken!);
      await getAllPerizinan();
    } catch (e) {
      print('Error create perizinan: $e');
      throw Exception('Failed to create perizinan $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllPerizinan() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _perizinanService.getAllPerizinan();
      _perizinan = data;
    } catch (e) {
      print('Error get all perizinan: $e');
      throw Exception('Failed to get all perizinan $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updatePerizinan(
      int idPerizinan, Perizinan updatedPerizinan) async {
    _isLoading = true;
    notifyListeners();

    try {
      final storedToken = await _secureStorage.read(key: 'token');
      await _perizinanService.updatePerizinan(
          idPerizinan, updatedPerizinan, storedToken!);
      await getAllPerizinan();
    } catch (e) {
      print('Error update qurban: $e');
      throw Exception('Failed to update qurban $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deletePerizinan(int idPerizinan) async {
    _isLoading = true;
    notifyListeners();
    try {
      final storedToken = await _secureStorage.read(key: 'token');

      await _perizinanService.deletePerizinan(idPerizinan, storedToken!);
      await getAllPerizinan();
    } catch (e) {
      print('error delete perizinan data');
      throw Exception('failed to delete perizinan $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
