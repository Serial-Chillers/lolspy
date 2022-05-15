import 'package:lolspy/constants/paths/paths.dart';

class ApiHelper {
  static String getBaseUrl(
      {String version = defaultVersion, String language = defaultLanguage}) {
    return 'http://ddragon.leagueoflegends.com/cdn/$version/data/$language';
  }

  static String getImage({required String name}) {
    return 'http://ddragon.leagueoflegends.com/cdn/$defaultVersion/img/champion/$name.png';
  }

  static get baseUrl => getBaseUrl();
  static get championImageUrl =>
      'http://ddragon.leagueoflegends.com/cdn/$defaultVersion/img';
  static get championUrl => '$baseUrl/champion';
}
