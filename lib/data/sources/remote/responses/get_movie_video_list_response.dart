import 'dart:convert';

class GetMovieVideoListResponse {
  int? id;
  List<GetMovieVideoListResponseResult>? results;

  GetMovieVideoListResponse({
    this.id,
    this.results,
  });

  factory GetMovieVideoListResponse.fromJson(String str) => GetMovieVideoListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieVideoListResponse.fromMap(Map<String, dynamic> json) => GetMovieVideoListResponse(
        id: json["id"],
        results: json["results"] == null
            ? []
            : List<GetMovieVideoListResponseResult>.from(
                json["results"]!.map((x) => GetMovieVideoListResponseResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class GetMovieVideoListResponseResult {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  GetMovieVideoListResponseResult({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory GetMovieVideoListResponseResult.fromJson(String str) =>
      GetMovieVideoListResponseResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMovieVideoListResponseResult.fromMap(Map<String, dynamic> json) => GetMovieVideoListResponseResult(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt,
        "id": id,
      };
}
