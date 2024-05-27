import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String description;
  final String posterPath;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterPath,
  });

  String get imageUrl => "https://image.tmdb.org/t/p/original/$posterPath";

  @override
  List<Object?> get props => [id, title, description, posterPath];

  @override
  bool get stringify => true;
}

final dummyMovies = List.generate(
  20,
  (index) => Movie(
    id: index.toString(),
    title: 'Godzilla x Kong: The New Empire',
    description:
        'A group of criminals kidnaps a teenage ballet dancer, the daughter of a notorious gang leader, in order to obtain a ransom of \$50 million, but over time, they discover that she is not just an ordinary girl. After the kidnappers begin to diminish, one by one, they discover, to their increasing horror, that they are locked inside with an unusual girl.',
    posterPath: 'z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
  ),
);
