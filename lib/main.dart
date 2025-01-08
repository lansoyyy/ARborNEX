// import 'package:arbornex/screens/main_screen.dart';
// import 'package:arbornex/screens/splash_screen.dart';
// import 'package:arbornex/screens/topdeals_hotdealcard_fetaureddealcard_screen.dart';
import 'package:flutter/material.dart';
import 'package:landscape/screens/main_screen.dart';

void main() {
  runApp(const ArborNexApp());
}

class ArborNexApp extends StatelessWidget {
  const ArborNexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARborNEX',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainScreen(),
    );
  }
}
