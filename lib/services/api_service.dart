import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class ApiService {
  static const String _baseUrl = 'https://www.freetogame.com/api/games';

  Future<List<Game>> fetchGames() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((game) => Game.fromJson(game)).toList();
      } else {
        throw Exception('Failed to load games: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load games: $e');
      throw Exception('Failed to load games: $e');
    }
  }
}
