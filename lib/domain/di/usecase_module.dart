import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/domain/usecases/usecases.dart';

Future<void> useCaseModule() async {
  getIt.registerFactory<MovieListByFilterTypeUsecase>(() => MovieListByFilterTypeInteractor(getIt()));
  getIt.registerFactory<SearchMoviesUsecase>(() => SearchMoviesInteractor(getIt()));
}
