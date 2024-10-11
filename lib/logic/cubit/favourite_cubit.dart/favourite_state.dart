
import 'package:webtoon/data/model/webtoon_model.dart';

abstract class FavoriteWebToonsState {
  final List<WebtoonModel> favoriteWebToons;

  FavoriteWebToonsState(this.favoriteWebToons);

  get webToons => null;
}

class FavoriteWebToonsInitialState extends FavoriteWebToonsState {
  FavoriteWebToonsInitialState() : super([]);
}

class FavoriteWebToonsLoadingState extends FavoriteWebToonsState {
  FavoriteWebToonsLoadingState(super.favoriteWebToons);
}

class FavoriteWebToonsLoadedState extends FavoriteWebToonsState {
  FavoriteWebToonsLoadedState(super.favoriteWebToons);
}

class FavoriteWebToonsErrorState extends FavoriteWebToonsState {
  final String message;

  FavoriteWebToonsErrorState(this.message, super.favoriteWebToons);
}
