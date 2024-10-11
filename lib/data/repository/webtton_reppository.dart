import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:webtoon/core/api.dart';
import 'package:webtoon/data/model/webtoon_model.dart';
import 'package:webtoon/logic/services/hive_webtoon_model.dart';

class WebtoonRepository {
  final _api = Api();

  Future<List<WebtoonModel>> fetchAllWebtoons() async {
    try {
      Response response = await _api.sendRequest
          .get('/fetch?page=1&genres=Harem%2CFantasy&nsfw=true&type=all');

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.isSuccess) {
        throw apiResponse.message.toString();
      }

      List<WebtoonModel> webtoons = (apiResponse.data as List<dynamic>)
        .map((json) => WebtoonModel.fromJson(json))
        .toList();

    final box = Hive.box<HiveWebtoonModel>('webtoonsBox');
    log("Accessed Hive box successfully");

    for (var webtoon in webtoons) {
      final hiveWebtoon = HiveWebtoonModel.fromJson(webtoon.toJson());
      await box.put(hiveWebtoon.id, hiveWebtoon);
    }
    return webtoons;
    
  } catch (e, stacktrace) {
    log('Error fetching webtoons: $e');
    log('Stacktrace: $stacktrace');
    try {
      final box = Hive.box<HiveWebtoonModel>('webtoonsBox');
      log('Accessing Hive box for cached data');
      return box.values.map((hiveWebtoon) => WebtoonModel.fromJson(hiveWebtoon.toJson())).toList();
    } catch (e) {
      log('Error accessing cached data: $e');
      rethrow;  // Rethrow the error after logging
    }
  }
}}