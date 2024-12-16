import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';

class Match {
  Game game;
  List<Player> players;
  Tournament tournament;
  Map<Player, int> score = {};

  Match({required this.game, required this.players, required this.tournament});
}
