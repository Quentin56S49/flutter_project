import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';

class Tournament {
  int id;
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

  copyWithGames({required List<Game> games}) {
    return Tournament(
      id: id,
      title: title,
      description: description,
      date: date,
      players: players,
      games: games,
      matches: matches,
    );
  }

  copyWithPlayers({required List<Player> players}) {
    return Tournament(
      id: id,
      title: title,
      description: description,
      date: date,
      players: players,
      games: games,
      matches: matches,
    );
  }
}
