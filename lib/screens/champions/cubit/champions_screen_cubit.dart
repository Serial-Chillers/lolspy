import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

part 'champions_screen_state.dart';

class ChampionsScreenCubit extends Cubit<ChampionsScreenState> {
  final ChampionRepo _championRepo;
  ChampionsScreenCubit({required ChampionRepo championRepo})
      : _championRepo = championRepo,
        super(ChampionsScreenState.initial());

  void getChampions() async {
    log('getChampions');
    emit(state.copyWith(status: ChampionsScreenStatus.loading));
    try {
      var champions = await _championRepo.getChampions();
      emit(state.copyWith(
          champions: champions, status: ChampionsScreenStatus.idle));
    } on Failure catch (err) {
      emit(state.copyWith(status: ChampionsScreenStatus.error, failure: err));
    }
  }
}
