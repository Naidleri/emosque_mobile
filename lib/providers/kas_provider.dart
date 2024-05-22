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
      final data = await _kasService.createKas(newKas, storedToken);
    }catch(e){
      print('Error create saldo kas: $e');
      throw Exception('Failed to create saldo kas');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllKas () async {
    _isLoading = true;
    notifyListeners();

    try{
      final data = await _kasService.getAllKas();
      _saldoKas.add(data);
    }catch(e){
      print('Error get all saldo kas: $e');
      throw Exception('Failed to get all saldo kas $e');
    }

    _idLoading = false;
    notifyListeners();
  }
}



