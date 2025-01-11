import 'package:flutter_project/models/game.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GameService {
  final String _clientId = 'icz03eibbfev4o2ibbpncbus59eik3';
  final String _accessToken = 'g2lyhbi0hwvk7lsqwnqt18fqm7bj3r';

  Future<List<Game>> fetchGames(String query) async {
    final url = Uri.parse('https://api.igdb.com/v4/games');
    final response = await http.post(
      url,
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json',
      },
      body: '''
        search "$query";
        fields name,summary,cover.image_id;
      ''',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((json) => Game.fromJsonAPI(json)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }
}
