import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/helpers/api_helpers/api_helpers.dart';
import 'package:lolspy/screens/champion/cubit/champion_screen_cubit.dart';
import '../../repositories/repositories.dart';
import 'widgets/splash_swiper.dart';

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
            title: const Text('champ'),
          ),
          body: state.status == ChampionScreenStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SplashSwiper(
                      id: state.champion!.id,
                      skins: state.champion!.skins!,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${state.champion!.name} - ${state.champion!.title}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CachedNetworkImage(
                                imageUrl: ApiHelper.getSkillImage(
                                    fileName:
                                        state.champion!.spells![0]!.image.full),
                              ),
                              ...state.champion!.spells!.map(
                                (e) => CachedNetworkImage(
                                  imageUrl: ApiHelper.getSkillImage(
                                      fileName: e!.image.full),
                                ),
                              )
                            ],
                          ),
                          Text(state.champion!.spells![0]!.name),
                          Text(state.champion!.spells![0]!.description),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
