import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/models/tournament.dart';

class AddGameWidget extends StatelessWidget {
  const AddGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentCubit, Tournament>(builder: (context, state) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Les jeux du tournois :',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search-game');
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          context.read<TournamentCubit>().state.games.isEmpty
              ? Center(child: Text('Aucun jeu ajouté'))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        context.read<TournamentCubit>().state.games.map((game) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              game.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
        ],
      );
    });
  }
}
