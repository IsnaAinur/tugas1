import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profil_screen.dart';
import 'penghitung_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      routes: {
        '/profil': (context) => const ProfilScreen(),
        '/penghitung': (context) => const PenghitungScreen(),
      },
    );
  }
}
