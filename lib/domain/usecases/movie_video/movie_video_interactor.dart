part of 'movie_video.dart';

class MovieVideoInteractor extends MovieVideoUsecase {
  final MovieRepository _repository;

  MovieVideoInteractor(this._repository);

  @override
  Future<List<MovieVideo>> execute(String param) async {
    return _repository.getMovieVideos(param);
  }
}
