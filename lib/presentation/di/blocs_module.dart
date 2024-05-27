import 'package:my_movie_app/di.dart';

import '../ui/pages/landing_page/bloc/movie_list_by_filter_type_bloc.dart';

Future<void> blocsModule() async {
  getIt.registerFactory(() => MovieListByFilterTypeBloc(getIt()));
}
