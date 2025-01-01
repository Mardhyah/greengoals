import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Menjaga ukuran kolom sesuai dengan kontennya
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green[100],
            child: const Icon(Icons.category, color: Colors.green),
          ),
          const SizedBox(height: 8),  // Sedikit memperbesar jarak
          Text(
            title,
            style: const TextStyle(
              fontSize: 14, // Menambah sedikit ukuran font agar lebih terbaca
              fontWeight: FontWeight.bold, // Menambahkan ketebalan font
              color: Colors.black, // Menambahkan warna font
            ),
          ),
        ],
      ),
    );
  }
}
