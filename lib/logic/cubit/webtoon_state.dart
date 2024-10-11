import 'package:webtoon/data/model/webtoon_model.dart';


abstract class WebtoonState {
  final List<WebtoonModel> webtoons;

  WebtoonState(this.webtoons);
}

class WebtoonInitialState extends WebtoonState {
  WebtoonInitialState() : super([]);
}

class WebtoonLoadingState extends WebtoonState {
  WebtoonLoadingState(super.webtoons);
}

class WebtoonLoadedState extends WebtoonState {
  WebtoonLoadedState(super.webtoons);
}

class WebtoonErrorState extends WebtoonState {
  final String message;
  WebtoonErrorState(super.webtoons, this.message);
}
