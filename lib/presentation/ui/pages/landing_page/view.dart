import 'package:flutter/material.dart';
import 'package:my_movie_app/domain/enums/movie_type.dart';
import 'package:my_movie_app/presentation/app/routes/routes.dart';

import 'sections/sections.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Movie App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, RoutePage.SEARCH_MOVIES),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              MovieSliderSection(),
              SizedBox(height: 16.0),
              MovieListSection(filterType: MovieFilterType.popular),
              SizedBox(height: 16.0),
              MovieListSection(filterType: MovieFilterType.nowPlaying),
              SizedBox(height: 16.0),
              MovieListSection(filterType: MovieFilterType.topRated),
            ],
          ),
        ));
  }
}
