import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/domain/models/models.dart';
import 'package:my_movie_app/presentation/ui/pages/landing_page/bloc/movie_list_by_filter_type_bloc.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../components/components.dart';

class MovieSliderSection extends StatefulWidget {
  const MovieSliderSection({super.key});

  @override
  State<MovieSliderSection> createState() => _MovieSliderSectionState();
}

class _MovieSliderSectionState extends State<MovieSliderSection> {
  late final CarouselController _carouselController;
  late final MovieListByFilterTypeBloc _movieListByFilterTypeBloc;

  @override
  void initState() {
    super.initState();
    _movieListByFilterTypeBloc = getIt<MovieListByFilterTypeBloc>();
    _carouselController = CarouselController();
    _movieListByFilterTypeBloc.add(const FetchMovieListByFilterTypeEvent(MovieFilterType.upcoming));
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListByFilterTypeBloc, MovieListByFilterTypeState>(
      bloc: _movieListByFilterTypeBloc,
      builder: (context, state) {
        if (state is MovieListByFilterTypeLoading) {
          return const SizedBox(
            height: 260,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is MovieListByFilterTypeLoaded) {
          final List<Movie> dummyMovies = state.movies;
          return Stack(
            children: [
              SizedBox(
                height: 260,
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  itemCount: dummyMovies.length,
                  itemBuilder: (context, index, realIndex) {
                    return MovieSliderItem(movie: dummyMovies[index]);
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3),
                  child: PageViewDotIndicator(
                    count: dummyMovies.length,
                    currentItem: _currentIndex,
                    unselectedColor: Colors.grey.withOpacity(0.4),
                    selectedColor: Colors.blue,
                    size: const Size(8.0, 8.0),
                    unselectedSize: const Size(8.0, 8.0),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is MovieListByFilterTypeError) {
          return SizedBox(
            height: 260,
            child: Center(child: Text(state.message)),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
