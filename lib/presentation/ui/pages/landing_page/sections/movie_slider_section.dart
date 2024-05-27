import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_movie_app/domain/models/models.dart';

import '../components/components.dart';

class MovieSliderSection extends StatefulWidget {
  const MovieSliderSection({super.key});

  @override
  State<MovieSliderSection> createState() => _MovieSliderSectionState();
}

class _MovieSliderSectionState extends State<MovieSliderSection> {
  final CarouselController _carouselController = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dummyMovies.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  _carouselController.animateToPage(entry.key);
                },
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key ? Colors.blue : Colors.grey.withOpacity(0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
