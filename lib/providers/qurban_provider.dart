part of 'providers.dart';

class QurbanProvider extends ChangeNotifier {
  List<Qurban> _qurban = [];
  List<Qurban> get qurban => _qurban;

  final QurbanService _qurbanService = QurbanService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => isLoading;

  Future<void> createQurban (Qurban newQurban) async {
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = _secureStorage.read(key: 'token');
      final data = await _qurbanService.createQurban(newQurban, storedToken); 
    }catch(e){
      print('Error update saldo kas: $e');
      throw Exception('Failed to update saldo kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}