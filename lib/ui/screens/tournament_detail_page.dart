import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/ui/components/tournament_components/add_player_widget/add_player_widget.dart';
import 'package:flutter_project/blocs/tournaments_cubit.dart';
import 'package:flutter_project/ui/components/tournament_components/information_widget/information_widget.dart';

import '../../blocs/tournament_cubit.dart';
import '../components/tournament_components/add_games_widget/add_game_widget.dart';
import '../components/tournament_components/add_match_widget/add_match_widget.dart';
import '../components/tournament_components/match_widget/match_widget.dart';

class TournamentDetail extends StatelessWidget {
  final Tournament tournament;

  const TournamentDetail({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentCubit, Tournament>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  context.read<TournamentsCubit>().deleteTournament(state.id);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  state.description,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const AddGameWidget(),
              const AddPlayerWidget(),
              AddMatchWidget(tournament: state),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Participants',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    if (state.players.isNotEmpty)
                      Column(
                        children: state.players.map((player) {
                          return ListTile(
                            title: Text(player.pseudo),
                            trailing: Text('Score: ${player.score ?? 0}'),
                          );
                        }).toList(),
                      )
                    else
                      const Text('Aucun participant pour le moment.'),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              if (state.matchs.isNotEmpty)
                ...state.matchs
                    .map((match) => MatchWidget(match: match))
                    .toList()
              else
                InformationWidget(information: 'Aucun match ajouté'),
            ],
          ),
        );
      },
    );
  }
}
