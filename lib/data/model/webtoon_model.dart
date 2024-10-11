class WebtoonModel {
  final String id;
  final String title;
  final String thumbnail;
  final String summary;
  final List<String> genres; // New field for genres
  final int totalChapters; //
   bool isFavorite; 

  WebtoonModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.summary,
    required this.genres,
    required this.totalChapters,
     this.isFavorite = false
  });

  // Factory constructor to create a WebtoonModel from JSON
  factory WebtoonModel.fromJson(Map<String, dynamic> json) {
    return WebtoonModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      thumbnail: json['thumb'] ?? '',
      summary: json['summary'] ?? '',
      genres: List<String>.from(json['genres'] ?? []), // Parsing genres as a list of strings
      totalChapters: json['total_chapter'] ?? 0, // Parsing total chapters
       isFavorite: json['isFavorite'] ?? false, );
  }

  // Method to convert a WebtoonModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumb': thumbnail,
      'summary': summary,
      'genres': genres,
      'total_chapter': totalChapters,
      'isFavorite': isFavorite,
    };
  }
}
