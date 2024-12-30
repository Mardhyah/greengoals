import 'package:flutter/material.dart';
import 'package:greengoals/models/tantangan.dart';
import 'ikut_tantangan_screen.dart';  // Import halaman IkutTantanganScreen

class DetailTantanganScreen extends StatelessWidget {
  final Tantangan tantangan;

  const DetailTantanganScreen({super.key, required this.tantangan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: Text(tantangan.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Agar bisa scroll jika konten panjang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Judul
              Text(
                tantangan.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),

               // Tanggal
              Text(
                'Berlaku hingga: ${tantangan.tanggal}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),

// Points
              Text(
                'Points: ${tantangan.points} EXP',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),


              // Gambar tantangan
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  tantangan.image,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              

              // Deskripsi
              Text(
                'Deskripsi: ${tantangan.deskripsi}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              
              // Tombol Ikuti Tantangan
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Arahkan ke halaman IkutTantanganScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IkutTantanganScreen(tantangan: tantangan),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32), // Warna tombol
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                child: const Text(
                  'Ikuti Tantangan',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
