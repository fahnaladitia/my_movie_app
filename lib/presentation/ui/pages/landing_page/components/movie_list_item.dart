import 'package:flutter/material.dart';
import 'package:my_movie_app/domain/models/models.dart';
import 'package:my_movie_app/presentation/components/components.dart';
import 'package:my_movie_app/presentation/ui/bottomsheets/movie_detail_bottomsheet/view.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  const MovieListItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMovieDetailBottomsheet(context, movie: movie),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.3,
        height: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicCachedImage(
              imageUrl: movie.imageUrl,
              height: 172,
              borderRadius: 8.0,
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 120.0,
              height: 20,
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
