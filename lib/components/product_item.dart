import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl; // Menyimpan URL gambar
  final VoidCallback onTap;

  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,  // Menambahkan parameter imageUrl
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,  // Atur ukuran lebar untuk responsivitas
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),  // Warna border lebih halus
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk dari assets
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),  // Agar gambar lebih halus
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl, // Menampilkan gambar dari URL
                  fit: BoxFit.cover,  // Agar gambar memenuhi kontainer
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red); // Menampilkan ikon error jika gambar tidak ditemukan
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,  // Ukuran font lebih besar
                overflow: TextOverflow.ellipsis,  // Agar teks yang panjang terpotong dengan "..."
              ),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 12,  // Ukuran font harga lebih kecil
                fontWeight: FontWeight.w500,  // Ketebalan teks harga lebih ringan
              ),
            ),
          ],
        ),
      ),
    );
  }
}
