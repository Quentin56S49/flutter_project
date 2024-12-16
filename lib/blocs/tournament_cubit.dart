import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';

class TournamentCubit extends Cubit<List<Tournament>> {
  TournamentCubit() : super([]);

  Future<void> createTournament(Tournament tournament) async {
    //await _tournamentRepository.createTournament(tournament);
  }

  Future<void> updateTournament(Tournament tournament) async {
    //await _tournamentRepository.updateTournament(tournament);
  }

  Future<void> deleteTournament(Tournament tournament) async {
    //await _tournamentRepository.deleteTournament(tournament);
  }

  Future<void> loadTournaments() async {
    final List<Tournament> tournaments = TournamentService().getTournaments();
    emit(tournaments);
  }
}
