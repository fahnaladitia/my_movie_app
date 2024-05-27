import 'package:flutter/material.dart';

class NoFoundPage extends StatefulWidget {
  const NoFoundPage({super.key});

  @override
  State<NoFoundPage> createState() => _NoFoundPageState();
}

class _NoFoundPageState extends State<NoFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('No Found Page')),
      body: const Center(
        child: Text('No Found Page'),
      ),
    );
  }
}
