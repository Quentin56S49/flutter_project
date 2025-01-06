import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/models/game.dart';
import 'package:flutter_project/models/match.dart';
import 'package:flutter_project/models/player.dart';
import 'package:flutter_project/models/tournament.dart';

class AddMatchPage extends StatefulWidget {
  final Tournament tournament;

  const AddMatchPage({super.key, required this.tournament});

  @override
  State<AddMatchPage> createState() => _AddMatchPageState();
}

class _AddMatchPageState extends State<AddMatchPage> {
  Game? _selectedGame;
  Player? _selectedWinner;
  Player? _selectedPlayers;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un match'),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<TournamentCubit, Tournament>(
        builder: (context, tournament) {
          final games = tournament.games;
          final players = tournament.players;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<Game>(
                  hint: const Text('Sélectionnez un jeu'),
                  value: _selectedGame,
                  items: games.map((game) {
                    return DropdownMenuItem<Game>(
                      value: game,
                      child: Text(game.title),
                    );
                  }).toList(),
                  onChanged: (game) {
                    setState(() {
                      _selectedGame = game;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description du match',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16.0),
                DropdownButton<Player>(
                  hint: const Text('Sélectionnez le vainqueur'),
                  value: _selectedWinner,
                  items: players.map((player) {
                    return DropdownMenuItem<Player>(
                      value: player,
                      child: Text(player.pseudo),
                    );
                  }).toList(),
                  onChanged: (player) {
                    setState(() {
                      _selectedWinner = player;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButton<Player>(
                  hint: const Text('Sélectionnez tous les participants'),
                  value: _selectedPlayers,
                  items: players.map((player) {
                    return DropdownMenuItem<Player>(
                      value: player,
                      child: Text(player.pseudo),
                    );
                  }).toList(),
                  onChanged: (player) {
                    setState(() {
                      _selectedPlayers = player;
                    });
                  },
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedGame != null &&
                          _selectedWinner != null &&
                          _descriptionController.text.isNotEmpty) {
                        final match = Match(
                          game: _selectedGame!,
                          players: players,
                          tournament: tournament,
                          description: _descriptionController.text,
                          vainqueur: _selectedWinner!,
                        );
                        context.read<TournamentCubit>().addMatch(match);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Veuillez remplir tous les champs.'),
                          ),
                        );
                      }
                    },
                    child: const Text('Valider'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
