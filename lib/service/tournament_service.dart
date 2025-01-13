import 'dart:convert';

import 'package:flutter_project/models/tournament.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TournamentService {
  final List<Tournament> _tournaments = [];

  Future<List<Tournament>> loadTournaments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('tournaments') ?? [];
    for (final String json in listJson) {
      _tournaments.add(Tournament.fromJson(jsonDecode(json)));
    }
    return _tournaments;
  }

  Future<void> addTournament(Tournament tournament) async {
    _tournaments.add(tournament);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (var tournament in _tournaments) {
      listJson.add(jsonEncode(tournament.toJson()));
    }
    prefs.setStringList('tournaments', listJson);
  }

  Future<List<Tournament>> getTournaments() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _tournaments;
  }

  Future<Tournament> getTournamentById(int id) async {
    final index = _tournaments.indexWhere((t) => t.id == id);
    return _tournaments[index];
  }

  Future<void> updateTournament(Tournament tournament) async {
    final index = _tournaments.indexWhere((t) => t.id == tournament.id);
    if (index != -1) {
      _tournaments[index] = tournament;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (var tournament in _tournaments) {
      listJson.add(jsonEncode(tournament.toJson()));
    }
    prefs.setStringList('tournaments', listJson);
  }

  Future<void> deleteTournament(String tournamentId) async {
    _tournaments.removeWhere((t) => t.id == tournamentId);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (var tournament in _tournaments) {
      listJson.add(jsonEncode(tournament.toJson()));
    }
    prefs.setStringList('tournaments', listJson);
  }
}
