import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lolspy/helpers/helpers.dart';
import 'package:lolspy/screens/champion/cubit/champion_screen_cubit.dart';
import 'package:lolspy/helpers/api_helpers/api_helpers.dart';
import '../../repositories/repositories.dart';

class ChampionScreenArgs {
  final String id;

  const ChampionScreenArgs({required this.id});
}

class ChampionScreen extends StatelessWidget {
  const ChampionScreen({super.key});

  static const String routeName = '/champion';

  static Route route({required ChampionScreenArgs args}) {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (context, _, __) => BlocProvider(
        create: (_) =>
            ChampionScreenCubit(championRepo: context.read<ChampionRepo>())
              ..getChampion(args.id),
        child: const ChampionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionScreenCubit, ChampionScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('champ'),
          ),
          body: state.status == ChampionScreenStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${state.champion!.id}_0.jpg',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Text(state.champion!.id),
                    Text(state.champion!.key),
                    Text(state.champion!.name),
                    Text(state.champion!.title),
                  ],
                ),
        );
      },
    );
  }
}
