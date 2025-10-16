import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profil_screen.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  Uint8List? _imageBytes;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _universitasController = TextEditingController();
  final TextEditingController _prodiController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  Future<void> _loadExistingData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final base64Image = prefs.getString('foto_profil');
      if (base64Image != null) {
        _imageBytes = base64Decode(base64Image);
      }
      _namaController.text = prefs.getString('nama') ?? '';
      _alamatController.text = prefs.getString('alamat') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _universitasController.text = prefs.getString('universitas') ?? '';
      _prodiController.text = prefs.getString('prodi') ?? '';
      _hobiController.text = prefs.getString('hobi') ?? '';
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    if (_imageBytes != null) {
      final base64Image = base64Encode(_imageBytes!);
      await prefs.setString('foto_profil', base64Image);
    }

    await prefs.setString('nama', _namaController.text);
    await prefs.setString('alamat', _alamatController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('universitas', _universitasController.text);
    await prefs.setString('prodi', _prodiController.text);
    await prefs.setString('hobi', _hobiController.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profil berhasil disimpan!")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    _imageBytes != null ? MemoryImage(_imageBytes!) : null,
                child: _imageBytes == null
                    ? const Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _universitasController,
              decoration: const InputDecoration(
                labelText: "Universitas",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _prodiController,
              decoration: const InputDecoration(
                labelText: "Program Studi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _hobiController,
              decoration: const InputDecoration(
                labelText: "Hobi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Simpan Perubahan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}