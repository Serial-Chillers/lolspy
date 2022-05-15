import 'package:lolspy/constants/paths/paths.dart';

class ApiHelper {
  static String getBaseUrl(
      {String version = defaultVersion, String language = defaultLanguage}) {
    return 'http://ddragon.leagueoflegends.com/cdn/$version/data/$language';
  }

  static get baseUrl => getBaseUrl();
}
