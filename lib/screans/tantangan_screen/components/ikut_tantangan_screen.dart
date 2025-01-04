import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:greengoals/models/tantangan.dart';
import 'package:greengoals/screans/tantangan_screen/tantangan_screen.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';

class IkutTantanganScreen extends StatefulWidget {
  final Tantangan tantangan;

  const IkutTantanganScreen({super.key, required this.tantangan});

  @override
  State<IkutTantanganScreen> createState() => _IkutTantanganScreenState();
}

class _IkutTantanganScreenState extends State<IkutTantanganScreen> {
  final TextEditingController _usernameController = TextEditingController();
  File? _buktiImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _buktiImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Tantangan',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
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

              // Formulir
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Formulir Username
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Formulir Bukti (Upload Foto)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bukti Mengikuti Tantangan (Foto)'),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () => _pickImage(ImageSource.gallery),
                          icon: const Icon(Icons.image,color: Color.fromARGB(255, 51, 50, 50),
                          ),
                          label: const Text('Pilih Foto',style: TextStyle(color: Color.fromARGB(255, 63, 55, 55)),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_buktiImage != null)
                          Image.file(
                            _buktiImage!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Kirim
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isNotEmpty && _buktiImage != null) {
                      // Menampilkan snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Selamat! Point kamu bertambah 50.')),
                      );

                      // Navigasi ke halaman TantanganScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const TantanganScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Isi semua form terlebih dahulu.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary40,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                child: const Text(
  'Kirim Bukti',
  style: TextStyle(
    color: Colors.white,
    fontSize: 18,
  ),
),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}