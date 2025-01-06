import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournaments_cubit.dart';
import 'package:flutter_project/ui/components/tournament_components/add_tournament_widget/add_tournament_widget.dart';
import 'package:flutter_project/ui/components/tournament_components/tournament_widget/tournament_widget.dart';
import '../../models/tournament.dart';
import '../../ui/screens/add_tournament_page.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournois'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<TournamentsCubit, List<Tournament>>(
        builder: (context, tournaments) {
          if (tournaments.isEmpty) {
            return Center(child: Text('Aucun tournoi'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tournaments.length,
                  itemBuilder: (context, index) {
                    return TournamentWidget(tournament: tournaments[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: AddTournamentWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTournamentPage()),
          );
        },
      ),
    );
  }
}
