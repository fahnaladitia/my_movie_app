import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movie_app/di.dart';
import 'package:my_movie_app/presentation/utils/utils.dart';

import 'presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await injectDI();
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
