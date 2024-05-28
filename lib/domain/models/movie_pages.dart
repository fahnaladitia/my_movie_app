import 'package:equatable/equatable.dart';

import 'models.dart';

class MoviePages extends Equatable {
  final List<Movie> movies;
  final int page;
  final int totalPages;

  const MoviePages({
    required this.movies,
    required this.page,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [movies, page, totalPages];
}
