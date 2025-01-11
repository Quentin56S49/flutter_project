import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/blocs/tournaments_cubit.dart';
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
  final _descriptionController = TextEditingController();
  List<Player> _selectedPlayers = [];

  @override
  Widget build(BuildContext context) {
    final games = widget.tournament.games;
    final players = widget.tournament.players;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un match'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<Game>(
              decoration: InputDecoration(
                labelText: 'Sélectionnez un jeu',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              value: _selectedGame,
              items: games.map((game) {
                return DropdownMenuItem<Game>(
                  value: game,
                  child: Text(
                    game.title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (game) {
                setState(() {
                  _selectedGame = game;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description du match',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<Player>(
              decoration: InputDecoration(
                labelText: 'Sélectionnez le vainqueur',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
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
            ExpansionTile(
              title: const Text('Sélectionnez les participants'),
              children: players.map((player) {
                return CheckboxListTile(
                  title: Text(player.pseudo),
                  value: _selectedPlayers.contains(player),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        _selectedPlayers.add(player);
                      } else {
                        _selectedPlayers.remove(player);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink[300]!, Colors.pink[700]!],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_selectedGame != null &&
                        _selectedWinner != null &&
                        _descriptionController.text.isNotEmpty &&
                        _selectedPlayers.isNotEmpty) {
                      final match = Match(
                        game: _selectedGame!,
                        players: _selectedPlayers,
                        tournament: widget.tournament,
                        description: _descriptionController.text,
                        vainqueur: _selectedWinner!,
                      );
                      context.read<TournamentCubit>().addMatch(match);
                      context.read<TournamentsCubit>().fetchTournaments();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Ajouter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
