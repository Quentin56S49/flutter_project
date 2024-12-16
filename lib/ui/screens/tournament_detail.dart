import 'package:flutter/material.dart';
import 'package:flutter_project/models/tournament.dart';

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
          Text(tournament.description),
        ],
      ),
    );
  }
}
