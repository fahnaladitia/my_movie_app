import 'dart:async';

import 'package:flutter/material.dart';

import 'presentation/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
