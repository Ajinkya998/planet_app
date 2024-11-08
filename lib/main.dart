import 'package:flutter/material.dart';

import 'screens/universe_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Universe App",
      home: UniverseHomePage(),
    );
  }
}
