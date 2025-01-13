import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/service/game_service.dart';

class GameCubit extends Cubit<List<Game>?> {
  GameCubit() : super([]);

  void searchGames(String query) async {
    emit(null);
    List<Game> addresses = await GameService().fetchGames(query);
    emit(addresses);
  }

  void addGame(Game game) {
    final updatedGames = List<Game>.from(state!)..add(game);
    emit(updatedGames);
  }
}
