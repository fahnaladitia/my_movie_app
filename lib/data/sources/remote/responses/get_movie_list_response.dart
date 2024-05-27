import 'dart:convert';

class GetMovieListResponse {
  int? page;
  List<GetMovieListResponseResult>? results;
  int? totalPages;
  int? totalResults;

  GetMovieListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory GetMovieListResponse.fromJson(String str) => GetMovieListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieListResponse.fromMap(Map<String, dynamic> json) => GetMovieListResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<GetMovieListResponseResult>.from(json["results"]!.map((x) => GetMovieListResponseResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class GetMovieListResponseResult {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  GetMovieListResponseResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory GetMovieListResponseResult.fromJson(String str) => GetMovieListResponseResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieListResponseResult.fromMap(Map<String, dynamic> json) => GetMovieListResponseResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
