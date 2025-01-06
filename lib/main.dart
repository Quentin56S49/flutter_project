import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/game_cubit.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/blocs/tournaments_cubit.dart';
import 'package:flutter_project/models/tournament.dart';
import 'package:flutter_project/service/tournament_service.dart';
import 'package:flutter_project/ui/screens/search_game_page.dart';
import 'package:flutter_project/ui/screens/tournament_detail.dart';
import 'package:flutter_project/ui/screens/tournament_page.dart';

void main() {
  final TournamentsCubit tournamentsCubit =
      TournamentsCubit(TournamentService());
  final GameCubit gameCubit = GameCubit();
  final Tournament tournament = Tournament(
    title: 'PlaceHolder',
    description: 'PlaceHolder',
    id: 0,
    date: DateTime.now(),
  );
  final TournamentCubit tournamentCubit = TournamentCubit(tournament);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => tournamentsCubit),
        BlocProvider(create: (_) => gameCubit),
        BlocProvider(create: (_) => tournamentCubit),
      ],
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
      initialRoute: '/',
      routes: {
        '/': (context) => const TournamentPage(),
        '/search-game': (context) => const SearchGamePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail-tournament') {
          final tournament = settings.arguments as Tournament;
          return MaterialPageRoute(
            builder: (context) => TournamentDetail(tournament: tournament),
          );
        }
        return null;
      },
    );
  }
}
