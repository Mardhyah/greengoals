import 'package:flutter/material.dart';
import 'package:greengoals/models/tantangan.dart';

class IkutTantanganScreen extends StatefulWidget {
  final Tantangan tantangan;

  const IkutTantanganScreen({super.key, required this.tantangan});

  @override
  State<IkutTantanganScreen> createState() => _IkutTantanganScreenState();
}

class _IkutTantanganScreenState extends State<IkutTantanganScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _buktiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text("Formulir Bukti Mengikuti Tantangan"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul tantangan
              Text(
                'Tantangan: ${widget.tantangan.title}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              
              // Formulir Username
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              
              // Formulir Bukti
              TextField(
                controller: _buktiController,
                decoration: const InputDecoration(
                  labelText: 'Bukti Mengikuti Tantangan (URL/Gambar)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              // Tombol Kirim
              ElevatedButton(
  onPressed: () {
    // Simpan atau kirim data sesuai dengan kebutuhan aplikasi
    if (_usernameController.text.isNotEmpty && _buktiController.text.isNotEmpty) {
      // Menampilkan snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tantangan Diikuti!')),
      );
      
      // Kembali ke halaman sebelumnya (TantanganScreen)
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Isi semua form terlebih dahulu.')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF2E7D32), // Warna tombol
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  ),
  child: const Text('Kirim Bukti', style: TextStyle(fontSize: 16)),
)

            ],
          ),
        ),
      ),
    );
  }
}
