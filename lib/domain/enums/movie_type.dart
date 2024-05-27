enum MovieFilterType {
  popular,
  topRated,
  upcoming,
  nowPlaying,
}

extension MovieFilterTypeExtension on MovieFilterType {
  String get toJsonType {
    switch (this) {
      case MovieFilterType.popular:
        return 'popular';
      case MovieFilterType.topRated:
        return 'top_rated';
      case MovieFilterType.upcoming:
        return 'upcoming';
      case MovieFilterType.nowPlaying:
        return 'now_playing';
    }
  }

  String get toReadableString {
    switch (this) {
      case MovieFilterType.popular:
        return 'Popular';
      case MovieFilterType.topRated:
        return 'Top Rated';
      case MovieFilterType.upcoming:
        return 'Upcoming';
      case MovieFilterType.nowPlaying:
        return 'Now Playing';
    }
  }
}
