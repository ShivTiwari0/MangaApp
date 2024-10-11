import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/logic/cubit/favourite_cubit.dart/favourite_state.dart';
import 'package:webtoon/logic/cubit/webtoon_cubit.dart';
import 'package:webtoon/logic/cubit/webtoon_state.dart';
import 'package:webtoon/logic/services/preference.dart';


class FavoriteWebToonsCubit extends Cubit<FavoriteWebToonsState> {
  final WebtoonCubit _webtoonCubit;
  StreamSubscription? _webToonSubscription;
 

  FavoriteWebToonsCubit(this._webtoonCubit) : super(FavoriteWebToonsInitialState()) {
    // Initialize the cubit with WebToon data and start listening to WebToon state changes
    _webToonSubscription = _webtoonCubit.stream.listen(_onWebToonStateChanged);
    _onWebToonStateChanged(_webtoonCubit.state);
  }

  Future<void> _onWebToonStateChanged(WebtoonState state) async {
    if (state is WebtoonLoadedState) {
      _loadFavoriteWebToons(state.webtoons);
    }
  }

  Future<void> _loadFavoriteWebToons(List<WebtoonModel> webToons) async {
    try {
      emit(FavoriteWebToonsLoadingState(state.favoriteWebToons));
      final favoriteIds = await Preference.getFavorits();

      final favoriteWebToons = webToons.where((webToon) => favoriteIds.contains(webToon.id)).toList();
      emit(FavoriteWebToonsLoadedState(favoriteWebToons));
    } catch (e) {
      emit(FavoriteWebToonsErrorState(e.toString(), state.favoriteWebToons));
    }
  }

  @override
  Future<void> close() {
    _webToonSubscription?.cancel();
    return super.close();
  }
}
