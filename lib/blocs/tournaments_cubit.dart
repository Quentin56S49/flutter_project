import 'package:bloc/bloc.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';

class TournamentsCubit extends Cubit<List<Tournament>> {
  final TournamentService _tournamentService;

  TournamentsCubit(this._tournamentService) : super([]);

  Future<void> loadTournaments() async {
    List<Tournament> tournaments = await _tournamentService.loadTournaments();
    emit(tournaments);
  }

  Future<void> fetchTournaments() async {
    try {
      final tournaments = await _tournamentService.getTournaments();
      List<Tournament> newTournaments = [];
      for (var tournament in tournaments) {
        newTournaments.add(tournament.copyWith());
      }
      emit(newTournaments);
    } catch (e) {
      emit(state);
    }
  }

  Future<void> addTournament(Tournament tournament) async {
    try {
      await _tournamentService.addTournament(tournament);
      final updatedTournaments = List<Tournament>.from(state)..add(tournament);
      emit(updatedTournaments);
    } catch (e) {
      emit(state);
    }
  }
}
