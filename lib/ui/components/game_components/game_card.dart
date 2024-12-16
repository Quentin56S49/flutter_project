import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/game_cubit.dart';
import 'package:flutter_project/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(game.title),
              Text(game.description),
            ],
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              context.read<GameCubit>().addGame(game);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${game.title} a été ajouté à la liste'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
