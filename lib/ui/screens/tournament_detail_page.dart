import 'package:flutter/material.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/ui/components/tournament_components/add_player_widget/add_player_widget.dart';
import '../components/tournament_components/add_games_widget/add_game_widget.dart';

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              tournament.description,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          AddGameWidget(),
          AddPlayerWidget(), // AddPlayerWidget est ici
        ],
      ),
    );
  }
}