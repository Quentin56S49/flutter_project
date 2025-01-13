import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';

class TournamentState {
  final Tournament tournament;
  final String? selectedWinnerId;

  TournamentState({required this.tournament, this.selectedWinnerId});

  TournamentState copyWith({Tournament? tournament, String? selectedWinnerId}) {
    return TournamentState(
        tournament: tournament ?? this.tournament,
        selectedWinnerId: selectedWinnerId ?? this.selectedWinnerId);
  }

  @override
  List<Object?> get props => [tournament, selectedWinnerId];
}

class TournamentCubit extends Cubit<Tournament> {
  final TournamentService _tournamentService;

  TournamentCubit(super.initialState, this._tournamentService);

  String? _selectedWinnerId;

  String? get selectedWinnerId => _selectedWinnerId;

  void setSelectedWinnerId(String? id) {
    _selectedWinnerId = id;
    emit(state.copyWith(selectedWinnerId: id));
  }

  void setTournament(Tournament tournament) {
    emit(tournament);
  }

  void getTournament() {
    emit(state);
  }

  void addGame(Game game) {
    if (!state.games.any((existingGame) => existingGame.title == game.title)) {
      final updatedGames = List<Game>.from(state.games)..add(game);
      final updatedTournament = state.copyWith(games: updatedGames);
      _tournamentService.updateTournament(updatedTournament);
      emit(updatedTournament);
    }
  }

  void addPlayer(Player player) {
    if (!state.players
        .any((existingPlayer) => existingPlayer.pseudo == player.pseudo)) {
      final updatedPlayers = List<Player>.from(state.players)..add(player);
      final updatedTournament = state.copyWith(players: updatedPlayers);
      _tournamentService.updateTournament(updatedTournament);
      emit(updatedTournament);
    }
  }

  void addMatch(Match match) {
    if (!state.matchs.any((existingMatch) => existingMatch.id == match.id)) {
      final updatedTournament = state.copyWith(
        matchs: [...state.matchs, match],
      );
      _tournamentService.updateTournament(updatedTournament);
      emit(updatedTournament);
    }
  }

  void deletePlayer(String playerPseudo) {
    final updatedPlayers = List<Player>.from(state.players)
      ..removeWhere((player) => player.pseudo == playerPseudo);
    final updatedTournament = state.copyWith(players: updatedPlayers);
    _tournamentService.updateTournament(updatedTournament);
    emit(updatedTournament);
  }

  void deleteGame(String gameTitle) {
    final updatedGames = List<Game>.from(state.games)
      ..removeWhere((game) => game.title == gameTitle);
    final updatedTournament = state.copyWith(games: updatedGames);
    _tournamentService.updateTournament(updatedTournament);
    emit(updatedTournament);
  }

  void deleteMatch(String matchId) {
    final updatedMatchs = List<Match>.from(state.matchs)
      ..removeWhere((match) => match.id == matchId);
    final updatedTournament = state.copyWith(matchs: updatedMatchs);
    _tournamentService.updateTournament(updatedTournament);
    emit(updatedTournament);
  }
}
