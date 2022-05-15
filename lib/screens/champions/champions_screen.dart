import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/models/champion.dart';
import 'package:lolspy/repositories/repositories.dart';
import 'package:lolspy/screens/champions/cubit/champions_screen_cubit.dart';

class ChampionsScreen extends StatelessWidget {
  const ChampionsScreen({super.key});

  static const String routeName = '/login';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (context, _, __) => BlocProvider(
        create: (_) =>
            ChampionsScreenCubit(championRepo: context.read<ChampionRepo>())
              ..getChampions(),
        child: const ChampionsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionsScreenCubit, ChampionsScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('temp'),
            automaticallyImplyLeading: false,
          ),
          body: state.status == ChampionsScreenStatus.loading
              ? Center(
                  child: const CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: [
                        ...state.champions.map(
                            (champion) => ChampionWidget(champion: champion))
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class ChampionWidget extends StatelessWidget {
  final Champion champion;
  const ChampionWidget({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(children: [Text(champion.name)]),
    );
  }
}
