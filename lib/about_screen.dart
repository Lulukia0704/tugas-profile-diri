// lib/about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: const Center(
        child: Text(
          'Ini adalah Halaman Kedua (About Me),tugas ini saya menggunakan ide saya sendiri dan design saya sendiri yang saya rancang di figma dulu', 
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}