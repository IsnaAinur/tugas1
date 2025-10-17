import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editprofil_screen.dart';
import 'penghitung_screen.dart';
import 'home_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  Uint8List? _imageBytes;
  String? nama;
  String? alamat;
  String? email;
  String? universitas;
  String? prodi;
  String? hobi;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final base64Image = prefs.getString('foto_profil');
      if (base64Image != null) {
        _imageBytes = base64Decode(base64Image);
      }
      nama = prefs.getString('nama') ?? "Isna Ainur Rohmah";
      alamat = prefs.getString('alamat') ?? "Boyolali";
      email = prefs.getString('email') ?? "isna@gmail.com";
      universitas = prefs.getString('universitas') ??
          "Universitas Duta Bangsa Surakarta";
      prodi = prefs.getString('prodi') ?? "Teknologi Rekayasa Perangkat Lunak";
      hobi = prefs.getString('hobi') ?? "Dengerin musik";
    });
  }

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
        actions: [
          // tombol edit di pojok kanan atas juga tetap ada
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: _goToEdit,
          ),
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Foto profil
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.teal.shade100,
              backgroundImage:
                  _imageBytes != null ? MemoryImage(_imageBytes!) : null,
              child: _imageBytes == null
                  ? const Icon(Icons.person, size: 80, color: Colors.white)
                  : null,
            ),

            const SizedBox(height: 12),



            // Nama
            Text(
              nama ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              prodi ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 20),

            // Tombol navigasi tambahan
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
            // 🔹 Tombol Edit Profil di bawah foto
            ElevatedButton.icon(
              onPressed: _goToEdit,
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Edit Profil",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),

            const SizedBox(height: 16),
            // Ikon love
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

            // Informasi profil
            _buildInfoCard(Icons.home, "Alamat", alamat ?? ""),
            _buildInfoCard(Icons.email, "Email", email ?? ""),
            _buildInfoCard(Icons.school, "Universitas", universitas ?? ""),
            _buildInfoCard(Icons.code, "Program Studi", prodi ?? ""),
            _buildInfoCard(Icons.local_pizza, "Hobi", hobi ?? ""),

            const SizedBox(height: 10),

            // Tombol logout
            Card(
              color: Colors.red.shade400,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // fungsi untuk membuka halaman edit profil
  Future<void> _goToEdit() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EditProfilScreen()),
    );
    _loadProfile(); // refresh setelah kembali
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title),
        subtitle: Text(value.isNotEmpty ? value : "-"),
      ),
    );
  }
}