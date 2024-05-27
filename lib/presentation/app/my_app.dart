import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie_app/presentation/app/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Movie App',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      initialRoute: RoutePage.INITIAL_ROUTE,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
