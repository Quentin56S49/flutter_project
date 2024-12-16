import 'package:bloc/bloc.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';

class TournamentCubit extends Cubit<List<Tournament>> {
  final TournamentService _tournamentService;

  TournamentCubit(this._tournamentService) : super([]);

  Future<void> fetchTournaments() async {
    try {
      final tournaments = await _tournamentService.getTournaments();
      emit(tournaments);
    } catch (e) {
      emit([]);
    }
  }

  Future<void> addTournament(Tournament tournament) async {
    try {
      await _tournamentService.addTournament(tournament);
      final updatedTournaments = List<Tournament>.from(state)
        ..add(tournament);
      emit(updatedTournaments);
    } catch (e) {
    }
  }
}
