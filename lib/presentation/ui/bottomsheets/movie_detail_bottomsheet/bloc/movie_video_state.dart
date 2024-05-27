part of 'movie_video_bloc.dart';

sealed class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

final class MovieVideoInitial extends MovieVideoState {}

final class MovieVideoLoading extends MovieVideoState {}

final class MovieVideoLoaded extends MovieVideoState {
  final YoutubePlayerController controller;

  const MovieVideoLoaded(this.controller);

  @override
  List<Object?> get props => [controller];
}

final class MovieVideoEmpty extends MovieVideoState {}

final class MovieVideoError extends MovieVideoState {
  final String message;

  const MovieVideoError(this.message);

  @override
  List<Object?> get props => [message];
}
