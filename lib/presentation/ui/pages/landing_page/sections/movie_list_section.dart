import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/presentation/components/components.dart';
import 'package:my_movie_app/presentation/ui/pages/landing_page/bloc/movie_list_by_filter_type_bloc.dart';

import '../components/components.dart';

class MovieListSection extends StatefulWidget {
  final MovieFilterType filterType;
  const MovieListSection({
    super.key,
    required this.filterType,
  });

  @override
  State<MovieListSection> createState() => _MovieListSectionState();
}

class _MovieListSectionState extends State<MovieListSection> {
  late final MovieListByFilterTypeBloc _movieListByFilterTypeBloc;

  @override
  void initState() {
    super.initState();
    _movieListByFilterTypeBloc = getIt<MovieListByFilterTypeBloc>();
    _movieListByFilterTypeBloc.add(FetchMovieListByFilterTypeEvent(widget.filterType));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.filterType.toReadableString,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 200.0,
          child: BlocBuilder<MovieListByFilterTypeBloc, MovieListByFilterTypeState>(
            bloc: _movieListByFilterTypeBloc,
            builder: (context, state) {
              if (state is MovieListByFilterTypeLoading) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 3,
                  separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                  itemBuilder: (context, index) {
                    return BasicShimmer.size(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 200.0,
                      borderRadius: BorderRadius.circular(8.0),
                    );
                  },
                );
              }
              if (state is MovieListByFilterTypeLoaded) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.movies.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                  itemBuilder: (context, index) {
                    return MovieListItem(movie: state.movies[index]);
                  },
                );
              }
              if (state is MovieListByFilterTypeError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
