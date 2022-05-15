import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/repositories/repositories.dart';
import 'package:lolspy/screens/screens.dart';

import 'configs/configs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChampionRepo>(
          create: (context) => ChampionRepo(),
        ),
      ],
      // child: MultiBlocProvider(
      //   providers: [],
      child: const MaterialApp(
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: ChampionsScreen.routeName,
      ),
    );
  }
}
