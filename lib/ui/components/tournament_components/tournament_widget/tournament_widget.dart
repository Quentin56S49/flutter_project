import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/models/tournament.dart';

class TournamentWidget extends StatelessWidget {
  final Tournament tournament;
  const TournamentWidget({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tournament.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tournament.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  context.read<TournamentCubit>().setTournament(tournament);
                  Navigator.pushNamed(context, '/detail-tournament',
                      arguments: tournament);
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            ]));
  }
}
