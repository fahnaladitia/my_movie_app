import 'package:flutter/material.dart';
import 'package:my_movie_app/domain/models/models.dart';
import 'package:my_movie_app/presentation/components/components.dart';

class MovieSliderItem extends StatelessWidget {
  final Movie movie;

  const MovieSliderItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            BasicCachedImage(
              imageUrl: movie.imageUrl,
              width: MediaQuery.of(context).size.width * 0.35,
              height: double.infinity,
              borderRadius: 8.0,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Flexible(
                    child: Text(
                      movie.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
