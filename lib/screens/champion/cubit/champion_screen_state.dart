part of 'champion_screen_cubit.dart';

enum ChampionScreenStatus { loading, error, idle }

class ChampionScreenState extends Equatable {
  final Champion? champion;
  final Spell? spell;
  final ChampionScreenStatus status;
  final Failure failure;

  const ChampionScreenState({
    this.champion,
    this.spell,
    required this.status,
    required this.failure,
  });

  factory ChampionScreenState.inital() {
    return const ChampionScreenState(
      failure: Failure(),
      status: ChampionScreenStatus.loading,
    );
  }

  @override
  List<Object?> get props => [champion, status, failure, spell];

  ChampionScreenState copyWith({
    Champion? champion,
    Spell? spell,
    ChampionScreenStatus? status,
    Failure? failure,
  }) {
    return ChampionScreenState(
      champion: champion ?? this.champion,
      spell: spell ?? this.spell,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
