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

}