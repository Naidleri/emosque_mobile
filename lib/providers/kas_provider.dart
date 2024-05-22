part of 'providers.dart';

class KasProvider extends ChangeNotifier{
  List<SaldoKas> _saldoKas = [];
  List<SaldoKas> get saldoKas => _saldoKas;

  final KasService _kasService = KasService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createKas (SaldoKas newKas) async{
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final responseData = await _kasService.createKas(newKas, storedToken);
      _saldoKas.add(responseData);
    }catch(e){
      print('Error create saldo kas: $e');
      throw Exception('Failed to create saldo kas');
    }
    _isLoading = false;
    notifyListeners();
  }
}



