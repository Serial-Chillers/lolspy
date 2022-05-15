import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lolspy/repositories/repositories.dart';

import '../../../models/models.dart';

part 'champion_screen_state.dart';

class ChampionScreenCubit extends Cubit<ChampionScreenState> {
  final ChampionRepo _championRepo;
  ChampionScreenCubit({required ChampionRepo championRepo})
      : _championRepo = championRepo,
        super(ChampionScreenState.inital());

  void getChampion(String id) async {
    log('getChampion');
    emit(state.copyWith(status: ChampionScreenStatus.loading));
    try {
      var champion = await _championRepo.getChampion(id);
      emit(state.copyWith(
          champion: champion, status: ChampionScreenStatus.idle));
    } on Failure catch (err) {
      emit(state.copyWith(status: ChampionScreenStatus.error, failure: err));
    }
  }
}
