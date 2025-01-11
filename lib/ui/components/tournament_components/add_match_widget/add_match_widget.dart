import 'package:flutter/material.dart';
import 'package:flutter_project/models/tournament.dart';
import '../../../screens/add_match_page.dart';

class AddMatchWidget extends StatelessWidget {
  final Tournament tournament;

  const AddMatchWidget({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Les matchs du tournoi :',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMatchPage(tournament: tournament),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
