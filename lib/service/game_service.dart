import 'package:flutter_project/models/game.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GameService {
  final String _clientId = 'YOUR_CLIENT_ID';
  final String _accessToken = 'YOUR_ACCESS_TOKEN';

  Future<List<Game>> fetchGames(String query) async {
    final url = Uri.parse('https://api.igdb.com/v4/games');
    final response = await http.post(
      url,
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'search': query,
        'fields': 'name,summary',
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }
}
