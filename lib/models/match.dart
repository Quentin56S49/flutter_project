import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/player.dart';

class Match {
  String id;
  Game game;
  List<Player> players;
  String description;
  Player vainqueur;

  Match(
      {required this.id,
      required this.game,
      required this.players,
      required this.description,
      required this.vainqueur});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'game': game.toJson(),
      'players': players.map((player) => player.toJson()).toList(),
      'description': description,
      'vainqueur': vainqueur.toJson(),
    };
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      game: Game.fromJson(json['game']),
      players: (json['players'] as List)
          .map((player) => Player.fromJson(player))
          .toList(),
      description: json['description'],
      vainqueur: Player.fromJson(json['vainqueur']),
    );
  }
}
