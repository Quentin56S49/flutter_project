import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/ui/screens/tournament_page.dart';

void main() {
  final TournamentCubit tournamentCubit = TournamentCubit();

  tournamentCubit.loadTournaments();

  runApp(
    BlocProvider<TournamentCubit>(
      create: (_) => tournamentCubit,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TournamentPage(),
    );
  }
}
