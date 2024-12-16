import 'package:flutter_project/models/tournament.dart';

class TournamentService {
  List<Tournament> getTournaments() {
    // This is a placeholder for the actual implementation
    List<Tournament> tournaments = [
      Tournament(0, 'Tournoi Test',
          'Tournoi de test pour vérifier le bon fonctionnement de l\'application',
          date: DateTime.now()),
    ];
    return tournaments;
  }
}
