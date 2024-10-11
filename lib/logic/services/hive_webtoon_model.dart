import 'package:hive/hive.dart';

part 'hive_webtoon_model.g.dart';

@HiveType(typeId: 0)
class HiveWebtoonModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? thumbnail;

  @HiveField(3)
  String? summary;

  @HiveField(4)
  List<String>? genres;

  @HiveField(5)
  int? totalChapters;

  @HiveField(6)
  bool? isFavorite;

  HiveWebtoonModel({
    this.id,
    this.title,
    this.thumbnail,
    this.summary,
    this.genres,
    this.totalChapters,
    this.isFavorite = false
  });

  factory HiveWebtoonModel.fromJson(Map<String, dynamic> json) {
    return HiveWebtoonModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumb'],
      summary: json['summary'],
      genres: List<String>.from(json['genres']),
      totalChapters: json['total_chapter'],
        isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumb': thumbnail,
      'summary': summary,
      'genres': genres,
      'total_chapter': totalChapters,
      
    };
  }
}
