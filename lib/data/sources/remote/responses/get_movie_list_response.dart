import 'dart:convert';

class GetMovieListResponse {
  GetMovieListResponseDates? dates;
  int? page;
  List<GetMovieListResponseResult>? results;
  int? totalPages;
  int? totalResults;

  GetMovieListResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory GetMovieListResponse.fromJson(String str) => GetMovieListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieListResponse.fromMap(Map<String, dynamic> json) => GetMovieListResponse(
        dates: json["dates"] == null ? null : GetMovieListResponseDates.fromMap(json["dates"]),
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<GetMovieListResponseResult>.from(json["results"]!.map((x) => GetMovieListResponseResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "dates": dates?.toMap(),
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class GetMovieListResponseDates {
  DateTime? maximum;
  DateTime? minimum;

  GetMovieListResponseDates({
    this.maximum,
    this.minimum,
  });

  factory GetMovieListResponseDates.fromJson(String str) => GetMovieListResponseDates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieListResponseDates.fromMap(Map<String, dynamic> json) => GetMovieListResponseDates(
        maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toMap() => {
        "maximum":
            "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
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
  DateTime? releaseDate;
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
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
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
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
