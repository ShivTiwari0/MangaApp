import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String _favorite = 'favorites';

 static Future<List<String>> getFavorits() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favorite) ?? [];
  }

 static Future<void> saveFavorite(String webtoonId, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList(_favorite) ?? [];

    if (isFavorite) {
      if (!favoriteIds.contains(webtoonId)) {
        favoriteIds.add(webtoonId);
      }
    } else {
      favoriteIds.remove(webtoonId);
    }

    await prefs.setStringList(_favorite, favoriteIds);
  }
}
