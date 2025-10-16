import 'package:flutter/material.dart';
import 'profil_screen.dart';
import 'penghitung_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text(
          'Halaman Utama',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 6,
        shadowColor: Colors.tealAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih menu yang ingin kamu buka',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 40),

              // Kartu tombol profil
              _buildMenuCard(
                context,
                icon: Icons.person,
                title: 'Profil',
                color1: Colors.teal,
                color2: Colors.tealAccent,
                destination: const ProfilScreen(),
              ),

              const SizedBox(height: 20),

              // Kartu tombol penghitung
              _buildMenuCard(
                context,
                icon: Icons.calculate,
                title: 'Penghitung',
                color1: Colors.green,
                color2: Colors.tealAccent,
                destination: const PenghitungScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget khusus untuk membuat kartu menu
  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color1,
    required Color color2,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color1.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}