import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/game_cubit.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/ui/components/game_components/game_card.dart';

class SearchGamePage extends StatelessWidget {
  const SearchGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rechercher un jeu'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) async {
                  context.read<GameCubit>().searchGames(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nom du jeu',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<GameCubit, List<Game>?>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: state == null
                        ? Center(
                            key: UniqueKey(),
                            child: CircularProgressIndicator(),
                          )
                        : state.isEmpty
                            ? Center(
                                key: UniqueKey(),
                                child: Text(
                                  'Aucun jeu trouvé',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey),
                                ),
                              )
                            : ListView.builder(
                                key: UniqueKey(),
                                itemCount: state.length,
                                itemBuilder: (context, index) {
                                  final game = state[index];
                                  return GameCard(game: game);
                                },
                              ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
