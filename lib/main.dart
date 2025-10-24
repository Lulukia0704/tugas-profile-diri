// lib/main.dart
import 'package:flutter/material.dart';
import 'about_screen.dart'; // Import halaman kedua

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold untuk menyediakan struktur dasar halaman
    return Scaffold(
      // Padding untuk memberikan ruang di sekitar konten utama
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column( // Kolom utama untuk semua widget secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 1. FOTO SAYA
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300, // Warna abu-abu yang mirip
              ),
              child:ClipOval( 
                child: Image.asset(
                  'assets/download.jpg', // <--- Gunakan path dan nama file Anda
                  fit: BoxFit.cover, // Memastikan gambar mengisi lingkaran
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. NAMA & JABATAN (Teks)
            const Text(
              'Luluk Asti Qomariah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Data Analyst',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const Text(
              'UI/UX designer',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // 3. TOMBOL 'About Me'
            SizedBox(
              width: double.infinity, // Membuat tombol selebar mungkin
              child: ElevatedButton(
                onPressed: () {
                  // Aksi: Navigasi ke Halaman Kedua (AboutScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent, // Warna pink solid
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Sudut melengkung
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'About Me',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 4. BAGIAN CONTACT
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // List Kontak (menggunakan Column dan _buildContactRow)
            Column(
              children: [
                _buildContactRow(
                    Icons.phone, '085***********20'),
                _buildContactRow(
                    // Instagram (Icon: Icons.camera_alt digunakan karena Icon Instagram tidak tersedia di paket Icons default)
                    Icons.camera_alt, 
                    '@leeviii.ya',
                    // Warna Instagram cenderung keunguan/merah muda
                    Colors.purple.shade700
                ),
                _buildContactRow(
                    Icons.linked_camera_rounded, // LinkedIn
                    'linkedin.com/in/blabla',
                    Colors.blue.shade700
                ),
                _buildContactRow(
                    Icons.linked_camera_rounded, // LinkedIn (Baris kedua)
                    'linkedin.com/in/blabla',
                    Colors.blue.shade700
                ),
                _buildContactRow(
                    Icons.mail, // Email
                    'lulukblablabla@gmail.com',
                    Colors.red.shade700
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 5. TECHNICAL SKILL
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Technical Skill :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Kotak Technical Skill (Row dengan Icons)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.pink.shade50, // Warna pink sangat muda
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row( // Baris untuk Ikon Skill
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Ikon Python (IconData tidak menyediakan ikon merek, jadi kita gunakan ikon placeholder yang paling mendekati)
                  _buildSkillIcon(Icons.code, Colors.blue), 
                  // Ikon Excel (Icon: Icons.grid_on digunakan sebagai placeholder)
                  _buildSkillIcon(Icons.grid_on, Colors.green), 
                  // Ikon Figma (Icon: Icons.design_services digunakan sebagai placeholder)
                  _buildSkillIcon(Icons.design_services, Colors.pink), 
                  // Ikon VS Code (Icon: Icons.terminal digunakan sebagai placeholder)
                  _buildSkillIcon(Icons.terminal, Colors.lightBlue), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi Pembantu untuk baris kontak
  Widget _buildContactRow(IconData icon, String text, [Color? iconColor = Colors.black]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 10),
          Expanded( // Expanded agar teks tidak melebihi batas jika panjang
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi Pembantu untuk ikon skill
  Widget _buildSkillIcon(IconData icon, Color color) {
    return Icon(
      icon,
      size: 40,
      color: color,
    );
  }
}