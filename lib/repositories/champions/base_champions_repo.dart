import '../../models/models.dart';

abstract class BaseChampionRepo {
  Future<List<Champion>?> getChampions();
  Future<Champion?> getChampion(String id);
}
