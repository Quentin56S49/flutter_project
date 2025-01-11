import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';

class Match {
  Game game;
  List<Player> players;
  String description;
  Player vainqueur;

  Match(
      {required this.game,
      required this.players,
      required this.description,
      required this.vainqueur});

  Map<String, dynamic> toJson() {
    return {
      'game': game.toJson(),
      'players': players.map((player) => player.toJson()).toList(),
      'description': description,
      'vainqueur': vainqueur.toJson(),
    };
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      game: Game.fromJson(json['game']),
      players: (json['players'] as List)
          .map((player) => Player.fromJson(player))
          .toList(),
      description: json['description'],
      vainqueur: Player.fromJson(json['vainqueur']),
    );
  }
}
