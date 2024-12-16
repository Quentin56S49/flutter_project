import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/game_cubit.dart';
import 'package:flutter_project/blocs/tournament_cubit.dart';
import 'package:flutter_project/service/tournament_service.dart';
import 'package:flutter_project/ui/screens/search_game_page.dart';
import 'package:flutter_project/ui/screens/tournament_page.dart';

void main() {
  final TournamentCubit tournamentCubit = TournamentCubit(TournamentService());
  final GameCubit gameCubit = GameCubit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => tournamentCubit),
        BlocProvider(create: (_) => gameCubit),
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
      initialRoute: '/search-game',
      routes: {
        '/': (context) => const TournamentPage(),
        '/search-game': (context) => const SearchGamePage(),
      },
    );
  }
}
