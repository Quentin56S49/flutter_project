import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';

class Match {
  Game game;
  List<Player> players;
  Tournament tournament;
  String description;
  Player vainqueur;

  Match({required this.game, required this.players, required this.tournament, required this.description, required this.vainqueur});
}
