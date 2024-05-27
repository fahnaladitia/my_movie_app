class MovieVideo {
  final String id;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  MovieVideo({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  bool get isTrailer {
    return type == 'Trailer' && isYoutubeVideo;
  }

  bool get isYoutubeVideo {
    return site == 'YouTube';
  }
}
