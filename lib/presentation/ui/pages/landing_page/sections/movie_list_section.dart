import 'package:flutter/material.dart';
import 'package:my_movie_app/domain/models/models.dart';

import '../components/components.dart';

class MovieListSection extends StatelessWidget {
  final String title;
  const MovieListSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: dummyMovies.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              return MovieListItem(movie: dummyMovies[index]);
            },
          ),
        ),
      ],
    );
  }
}
