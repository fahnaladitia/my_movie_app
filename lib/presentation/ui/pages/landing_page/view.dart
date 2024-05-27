import 'package:flutter/material.dart';

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
              onPressed: () {},
            ),
          ],
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              MovieSliderSection(),
              SizedBox(height: 16.0),
              MovieListSection(title: 'Now Playing'),
              SizedBox(height: 16.0),
              MovieListSection(title: 'Popular'),
              SizedBox(height: 16.0),
              MovieListSection(title: 'Top Rated'),
            ],
          ),
        ));
  }
}
