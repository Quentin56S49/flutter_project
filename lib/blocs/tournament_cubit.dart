import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';

class TournamentCubit extends Cubit<Tournament> {
  final TournamentService _tournamentService;

  TournamentCubit(super.initialState, this._tournamentService);

  void setTournament(Tournament tournament) {
    emit(tournament);
  }

  void getTournament() {
    emit(state);
  }

  void addGame(Game game) {
    final updatedGames = List<Game>.from(state.games)..add(game);
    final updatedTournament = state.copyWith(games: updatedGames);
    _tournamentService.updateTournament(updatedTournament);
    emit(updatedTournament);
  }

  void addPlayer(Player player) {
    final updatedPlayers = List<Player>.from(state.players)..add(player);
    final updatedTournament = state.copyWith(players: updatedPlayers);
    emit(updatedTournament);
  }

  void addMatch(Match match) {
    final updatedTournament = state.copyWith(
      matchs: [...state.matchs, match],
    );
    emit(updatedTournament);
  }
}
