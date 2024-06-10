part of 'providers.dart';

class LaporanProvider extends ChangeNotifier{
  List<LaporanKas> _laporanKas = [];
  List<LaporanKas> get laporanKas => _laporanKas;

  final LaporanService _laporanService = LaporanService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createLaporan (LaporanKas newLaporan) async{
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _laporanService.createLaporan(newLaporan, storedToken!);
    }catch(e){
      print('Error create laporan kas: $e');
      throw Exception('Failed to create laporan kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }

   Future<void> getAllLaporan () async {
    _isLoading = true;
    notifyListeners();

    try{
      final data = await _laporanService.getAllLaporan();
      _laporanKas = data;
    }catch(e){
      print('Error get all laporan saldo kas: $e');
      throw Exception('Failed to get all laporan  saldo kas $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> approveLaporan (int idLaporan) async{
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _laporanService.approveLaporan(idLaporan, storedToken!);
    }catch(e){
      print('Error approve laporan kas: $e');
      throw Exception('Failed to approve laporan kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> rejectLaporan (int idLaporan) async{
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _laporanService.rejectLaporan(idLaporan, storedToken!);
    }catch(e){
      print('Error reject laporan kas: $e');
      throw Exception('Failed to reject laporan kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}