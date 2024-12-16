import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';

class Tournament {
  int id;
  String title;
  String description;
  DateTime date;
  List<Player> players;
  List<Game> games;
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
}