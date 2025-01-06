import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';

class TournamentCubit extends Cubit<Tournament> {
  TournamentCubit(super.initialState);

  void setTournament(Tournament tournament) {
    emit(tournament);
  }

  void addGame(Game game) {
    final updatedGames = List<Game>.from(state.games)..add(game);
    final updatedTournament = state.copyWithGames(games: updatedGames);
    emit(updatedTournament);
  }

  void addPlayer(Player player){
    final updatedPlayers = List<Player>.from(state.players)..add(player);
    final updatedTournament = state.copyWithPlayers(players: updatedPlayers);
    emit(updatedTournament);
  }

  void addMatch(Match match) {
    final updatedTournament = state.copyWithMatch(
      matchs: [...state.matchs, match],
    );
    emit(updatedTournament);
  }
}
