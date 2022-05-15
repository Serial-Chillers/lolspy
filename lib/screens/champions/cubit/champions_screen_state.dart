part of 'champions_screen_cubit.dart';

enum ChampionsScreenStatus { loading, idle, error }

class ChampionsScreenState extends Equatable {
  final List<Champion> champions;
  final Failure failure;
  final ChampionsScreenStatus status;

  const ChampionsScreenState({
    required this.champions,
    required this.failure,
    required this.status,
  });

  factory ChampionsScreenState.initial() {
    return const ChampionsScreenState(
      champions: [],
      failure: Failure(),
      status: ChampionsScreenStatus.loading,
    );
  }

  @override
  List<Object> get props => [champions, failure, status];

  ChampionsScreenState copyWith({
    List<Champion>? champions,
    Failure? failure,
    ChampionsScreenStatus? status,
  }) {
    return ChampionsScreenState(
      champions: champions ?? this.champions,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }
}
