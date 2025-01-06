import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/tournament.dart';

class TournamentCubit extends Cubit<Tournament> {
  TournamentCubit(super.initialState);

  void setTournament(Tournament tournament) {
    emit(tournament);
  }

  void addGame(Game game) {
    final updatedGames = List<Game>.from(state.games)..add(game);
    final updatedTournament = state.copyWith(games: updatedGames);
    emit(updatedTournament);
  }
}
