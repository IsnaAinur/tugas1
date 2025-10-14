import 'package:flutter/material.dart';
import 'penghitung_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Foto profil
            CircleAvatar(
              backgroundImage: const AssetImage("asset/profil.jpg"),
              radius: 80,
              backgroundColor: Colors.teal.shade100,
            ),
            const SizedBox(height: 16),
            
            // Nama
            const Text(
              "Isna Ainur Rohmah",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Mahasiswi Teknologi Rekayasa Perangkat Lunak",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PenghitungScreen()),
                );
              },
              child: const Text("Pindah Penghitung"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali"),
            ),

            const SizedBox(height: 20),
            // Baris ikon love
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, color: Colors.redAccent, size: 28),
                SizedBox(width: 8),
                Icon(Icons.favorite, color: Colors.pink, size: 28),
                SizedBox(width: 8),
                Icon(Icons.favorite, color: Colors.redAccent, size: 28),
              ],
            ),
            const SizedBox(height: 30),

            // Informasi dalam Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.home, color: Colors.teal),
                title: Text("Alamat"),
                subtitle: Text("Boyolali"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text("Email"),
                subtitle: Text("isna@gmail.com"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.school, color: Colors.teal),
                title: Text("Universitas"),
                subtitle: Text("Universitas Duta Bangsa Surakarta"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.code, color: Colors.teal),
                title: Text("Program Studi"),
                subtitle: Text("Teknologi Rekayasa Perangkat Lunak"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.local_pizza, color: Colors.teal),
                title: Text("Hobi"),
                subtitle: Text("Dengerin musik"),
              ),
            ),
            const SizedBox(height: 10),

            // Tombol logout
            Card(
              color: Colors.red.shade400,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}