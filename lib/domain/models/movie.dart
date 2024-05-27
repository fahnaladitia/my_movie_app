import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl];

  @override
  bool get stringify => true;
}

final dummyMovies = List.generate(
  10,
  (index) => Movie(
    id: index.toString(),
    title: 'Title $index',
    description: 'Description $index',
    imageUrl: 'https://picsum.photos/200/300?random=$index',
  ),
);
