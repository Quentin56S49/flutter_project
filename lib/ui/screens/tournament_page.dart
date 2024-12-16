import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/ui/components/tournament_components/add_tournament_widget/add_tournament_widget.dart';
import 'package:flutter_project/ui/components/tournament_components/tournament_widget/tournament_widget.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentCubit, List<Tournament>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Tournois'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return TournamentWidget(tournament: state[index]);
                  },
                ),
              ),
              Text('Ajouter un tournoi'),
            ],
          ),
        );
      },
    );
  }
}
