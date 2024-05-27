import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_app/core/common/exceptions/base_exception.dart';
import 'package:my_movie_app/domain/usecases/usecases.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'movie_video_event.dart';
part 'movie_video_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  final MovieVideoUsecase _movieVideoUsecase;
  MovieVideoBloc(this._movieVideoUsecase) : super(MovieVideoInitial()) {
    on<MovieVideoEventFetch>((event, emit) async {
      emit(MovieVideoLoading());
      try {
        final movieVideos = await _movieVideoUsecase.execute(event.movieId);

        if (movieVideos.isEmpty) {
          emit(MovieVideoEmpty());
          return;
        }
        final videoIdTrailer = movieVideos.firstWhereOrNull((element) => element.isTrailer);

        if (videoIdTrailer != null) {
          emit(
            MovieVideoLoaded(
              YoutubePlayerController(
                initialVideoId: videoIdTrailer.key,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  showLiveFullscreenButton: false,
                ),
              ),
            ),
          );
          return;
        }
        final videoIdYoutube = movieVideos.firstWhereOrNull((element) => element.isYoutubeVideo);

        if (videoIdYoutube != null) {
          emit(
            MovieVideoLoaded(
              YoutubePlayerController(
                initialVideoId: videoIdYoutube.key,
                flags: const YoutubePlayerFlags(autoPlay: false),
              ),
            ),
          );
          return;
        }
        emit(MovieVideoEmpty());
      } on BaseException catch (e) {
        emit(MovieVideoError(e.message));
      } catch (e) {
        emit(MovieVideoError(e.toString()));
      }
    });
  }
}
