part of 'movie_video_bloc.dart';

sealed class MovieVideoEvent extends Equatable {
  const MovieVideoEvent();

  @override
  List<Object> get props => [];
}

final class MovieVideoEventFetch extends MovieVideoEvent {
  final String movieId;

  const MovieVideoEventFetch(this.movieId);

  @override
  List<Object> get props => [movieId];
}
