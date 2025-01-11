import 'package:flutter_project/models/tournament.dart';

class TournamentService {
  final List<Tournament> _tournaments = [];

  Future<void> addTournament(Tournament tournament) async {
    try {
      await Future.delayed(Duration(milliseconds: 500));

      _tournaments.add(tournament);
    } catch (error) {
      throw TournamentCreationFailure(
          'Erreur lors de la création du tournoi: ${error.toString()}');
    }
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
  }

  Future<void> deleteTournament(int tournamentId) async {
    _tournaments.removeWhere((t) => t.id == tournamentId);
  }
}

class TournamentCreationFailure implements Exception {
  final String message;
  TournamentCreationFailure(this.message);
}
