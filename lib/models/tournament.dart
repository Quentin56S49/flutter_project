import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';

class Tournament {
  int id;
  String title;
  String description;
  DateTime date;
  List<Player> players;
  List<Game> games = [];
  List<Match> matchs;

  Tournament({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.players = const [],
    this.games = const [],
    this.matchs = const [],
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
      matchs: matchs,
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
      matchs: matchs,
    );
  }

  copyWithMatch({required List<Match> matchs}) {
    return Tournament(
      id: id,
      title: title,
      description: description,
      date: date,
      players: players,
      games: games,
      matchs: matchs,
    );
  }
}
