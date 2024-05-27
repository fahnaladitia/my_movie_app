import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/presentation/ui/pages/search_movies_page/bloc/search_movies_bloc.dart';

import '../ui/pages/landing_page/bloc/movie_list_by_filter_type_bloc.dart';

Future<void> blocsModule() async {
  getIt.registerFactory(() => MovieListByFilterTypeBloc(getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(getIt()));
}
