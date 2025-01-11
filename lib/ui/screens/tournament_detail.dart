import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/ui/components/tournament_components/add_games_widget/add_game_widget.dart';

class TournamentDetail extends StatelessWidget {
  final Tournament tournament;
  const TournamentDetail({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tournament.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<TournamentCubit, Tournament>(builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                state.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            AddGameWidget(),
          ],
        );
      }),
    );
  }
}
