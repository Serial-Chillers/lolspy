import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lolspy/helpers/api_helpers/api_helpers.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import 'base_champions_repo.dart';

class ChampionRepo extends BaseChampionRepo {
  @override
  Future<List<Champion>?> getChampions() async {
    final response =
        await http.get(Uri.parse('${ApiHelper.baseUrl}/champion.json'));

    try {
      var rsp = jsonDecode(response.body);
      Map data = rsp['data'];

      List<Champion> champions = [];
      for (var value in data.values) {
        var champion = Champion.fromMap(value);
        champions.add(champion);
      }
      return champions;
    } on PlatformException catch (err) {
      throw Failure(code: err.code, message: err.message!);
    }
  }
}
