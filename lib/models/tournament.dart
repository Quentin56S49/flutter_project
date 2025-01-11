import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';

class Tournament {
  String id;
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

  Tournament copyWith(
      {String? id,
      String? title,
      String? description,
      List<Game>? games,
      List<Player>? players,
      List<Match>? matchs}) {
    return Tournament(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date,
      players: players ?? this.players,
      games: games ?? this.games,
      matchs: matchs ?? this.matchs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'players': players.map((player) => player.toJson()).toList(),
      'games': games.map((game) => game.toJson()).toList(),
      'matchs': matchs.map((match) => match.toJson()).toList(),
    };
  }

  factory Tournament.fromJson(Map<String, dynamic> json) {
    print(json['games']);
    return Tournament(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      players: (json['players'] as List)
          .map((player) => Player.fromJson(player))
          .toList(),
      games:
          (json['games'] as List).map((game) => Game.fromJson(game)).toList(),
      matchs: (json['matchs'] as List)
          .map((match) => Match.fromJson(match))
          .toList(),
    );
  }
}
