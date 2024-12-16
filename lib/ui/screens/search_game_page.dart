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
          title: Text('Game'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(children: [
          TextField(
            onChanged: (value) async {
              context.read<GameCubit>().searchGames(value);
            },
            decoration: InputDecoration(
              labelText: 'Nom du jeu',
            ),
          ),
          Expanded(child:
              BlocBuilder<GameCubit, List<Game>>(builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              children: state.map((game) {
                return GameCard(game: game);
              }).toList(),
            );
          })),
        ]));
  }
}
