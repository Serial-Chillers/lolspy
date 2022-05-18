import 'package:lolspy/constants/paths/paths.dart';

class ApiHelper {
  static String getBaseUrl(
      {String version = defaultVersion, String language = defaultLanguage}) {
    return 'http://ddragon.leagueoflegends.com/cdn';
  }

  static String getDataUrl(
      {String version = defaultVersion, String language = defaultLanguage}) {
    return '$baseUrl/$version/data/$language';
  }

  static String getImage({required String name}) {
    return '$baseUrl/$defaultVersion/img/champion/$name.png';
  }

  static String getSplash({required String id, required int num}) {
    return '$baseUrl/img/champion/splash/${id}_$num.jpg';
  }

  static String getSkillImage({required String fileName}) {
    return '$baseUrl/12.9.1/img/spell/$fileName';
  }

  static String getPassiveImage({required String fileName}) {
    return '$baseUrl/12.9.1/img/passive/$fileName';
  }

  static get baseUrl => getBaseUrl();
  static get dataUrl => getDataUrl();
  static get championImageUrl =>
      'http://ddragon.leagueoflegends.com/cdn/$defaultVersion/img';
  static get championUrl => '$dataUrl/champion';
}
// 