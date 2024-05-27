import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_movie_app/di.dart';

import 'presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDI();

  runApp(const MyApp());
}
