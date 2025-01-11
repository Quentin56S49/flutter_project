import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';

class Tournament {
  String id;
  String title;
  String description;
  DateTime date;
  List<Player> players;
  List<Game> games = [];
  List<Match> matches;

  Tournament({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.players = const [],
    this.games = const [],
    this.matches = const [],
  });

  void addPlayer(Player player) {
    players.add(player);
  }

  void addGame(Game game) {
    games.add(game);
  }

  Tournament copyWith(
      {String? id, String? title, String? description, List<Game>? games}) {
    return Tournament(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date,
      players: players,
      games: games ?? this.games,
      matches: matches,
    );
  }
}
