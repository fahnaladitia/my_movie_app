import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/presentation/components/components.dart';
import 'package:my_movie_app/presentation/ui/pages/search_movies_page/bloc/search_movies_bloc.dart';

import 'components/components.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({super.key});

  @override
  State<SearchMoviesPage> createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchMoviesPage> {
  late final TextEditingController _searchController;
  late final SearchMoviesBloc _searchMoviesBloc;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchMoviesBloc = getIt<SearchMoviesBloc>();
    _searchController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _searchMoviesBloc.add(SearchMoviesEventLoadMore());
      }
    });

    _searchMoviesBloc.add(const SearchMoviesEventSearch(''));
    _searchController.addListener(() {
      _searchMoviesBloc.add(SearchMoviesEventSearch(_searchController.text));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            controller: _searchController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Search movies',
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
              contentPadding: EdgeInsets.zero,
              fillColor: Colors.grey[200],
              filled: true,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        body: BlocConsumer<SearchMoviesBloc, SearchMoviesState>(
          listener: (context, state) {
            if (state is SearchMoviesError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is SearchMoviesErrorMore) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          bloc: _searchMoviesBloc,
          builder: (context, state) {
            if (state is SearchMoviesLoading) {
              return GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                itemBuilder: (context, index) {
                  return BasicShimmer.aspectRatio(
                    aspectRatio: 0.7,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  );
                },
              );
            }
            if (state is SearchMoviesError) {
              return Center(child: Text(state.message));
            }
            if (state is SearchMoviesEmpty) {
              return const Center(child: Text('No movies found'));
            }
            if (state is SearchMoviesLoaded) {
              return GridView.builder(
                itemCount: state.movies.length,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return SearchMovieItem(movie: movie);
                },
              );
            }

            if (state is SearchMoviesLoadingMore) {
              return GridView.builder(
                itemCount: state.movies.length + 1,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                itemBuilder: (context, index) {
                  if (index < state.movies.length) {
                    final movie = state.movies[index];
                    return SearchMovieItem(movie: movie);
                  }
                  return BasicShimmer.aspectRatio(
                    aspectRatio: 0.7,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  );
                },
              );
            }

            if (state is SearchMoviesLoadedMore) {
              return GridView.builder(
                itemCount: state.movies.length,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return SearchMovieItem(movie: movie);
                },
              );
            }

            if (state is SearchMoviesErrorMore) {
              return GridView.builder(
                itemCount: state.movies.length + 1,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                itemBuilder: (context, index) {
                  if (index < state.movies.length) {
                    final movie = state.movies[index];
                    return SearchMovieItem(movie: movie);
                  }
                  // Retry Button
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => _searchMoviesBloc.add(SearchMoviesEventLoadMore()),
                      child: const Text('Retry'),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
