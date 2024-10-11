import 'package:webtoon/logic/services/preference.dart';

import 'package:webtoon/data/model/webtoon_model.dart';

class FavoriteService {
  Future<List<WebtoonModel>> loadFavorites(List<WebtoonModel> blogs) async {
    final favoriteIds = await Preference.getFavorits();
    for (var blog in blogs) {
      blog.isFavorite = favoriteIds.contains(blog.id);
    }
    return blogs;
  }

  Future<void> toggleFavorite(String blogId, bool isFavorite) async {
    await Preference.saveFavorite(blogId, isFavorite);
  }
}
