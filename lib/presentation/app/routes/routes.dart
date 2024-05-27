import 'package:flutter/material.dart';

import '../../ui/pages/pages.dart';

part 'page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final name = settings.name;

  switch (name) {
    case RoutePage.LANDING:
      return MaterialPageRoute(builder: (_) => const LandingPage());
    case RoutePage.SEARCH_MOVIES:
      return MaterialPageRoute(builder: (_) => const SearchMoviesPage());
    default:
      return MaterialPageRoute(builder: (_) => const NoFoundPage());
  }
}
