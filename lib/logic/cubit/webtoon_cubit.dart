import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/data/repository/webtton_reppository.dart';
import 'package:webtoon/logic/services/preference.dart';
import 'package:webtoon/logic/services/hive_webtoon_model.dart';
import 'package:webtoon/logic/cubit/webtoon_state.dart';

class WebtoonCubit extends Cubit<WebtoonState> {
  final _webtoonRepository = WebtoonRepository();


  WebtoonCubit() : super(WebtoonInitialState()) {
    _initialize();
  }

  void _initialize() async {
    emit(WebtoonLoadingState(state.webtoons));
    try {
      List<WebtoonModel> webtoons = await _webtoonRepository.fetchAllWebtoons();
     



      emit(WebtoonLoadedState(webtoons));
    } catch (e) {
      emit(WebtoonErrorState(state.webtoons, e.toString()));
    }
  }

  void toggleFavorite(String webtoonId){

    final   updatedWebtoons= state.webtoons.map((webtoon) {if(webtoon.id==webtoonId){
      webtoon.isFavorite=!webtoon.isFavorite;
      Preference.saveFavorite(webtoon.id, webtoon.isFavorite);
    }
    return webtoon;
    
    } ,).toList();
    emit( WebtoonLoadedState(updatedWebtoons));
  }

  
}
