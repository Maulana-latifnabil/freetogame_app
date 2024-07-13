import 'dart:convert'; // Digunakan untuk mengonversi data JSON
import 'package:http/http.dart'
    as http; // Library untuk melakukan permintaan HTTP
import '../models/game.dart'; // Mengimpor model Game

class ApiService {
  // URL dasar untuk API
  static const String _baseUrl = 'https://www.freetogame.com/api/games';

  // Fungsi untuk mengambil daftar game dari API
  Future<List<Game>> fetchGames() async {
    try {
      // Melakukan permintaan GET ke API
      final response = await http.get(Uri.parse(_baseUrl));

      // Memeriksa apakah status kode dari respons adalah 200 (berhasil)
      if (response.statusCode == 200) {
        // Mengonversi respons JSON ke dalam list
        List jsonResponse = json.decode(response.body);
        // Mengonversi list JSON ke list objek Game
        return jsonResponse.map((game) => Game.fromJson(game)).toList();
      } else {
        // Melempar kesalahan jika status kode tidak 200
        throw Exception('Failed to load games: ${response.statusCode}');
      }
    } catch (e) {
      // Menangkap kesalahan yang terjadi dan mencetak pesan kesalahan
      print('Failed to load games: $e');
      throw Exception('Failed to load games: $e');
    }
  }
}
