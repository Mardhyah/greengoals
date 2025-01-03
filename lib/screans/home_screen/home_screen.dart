import 'package:flutter/material.dart';
import 'package:greengoals/components/category_item.dart';
import 'package:greengoals/components/product_item.dart';
import 'package:greengoals/screans/home_screen/components/detail_produk.dart';
import 'package:greengoals/screans/home_screen/components/keranjang.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Greengoals',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeranjangScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Cari produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Banner
            Container(
              height: 150,
              width: double.infinity, // Menjadikan gambar memenuhi lebar layar
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Membuat sudut membulat
                color: Colors.green[100],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10), // Menjaga sudut gambar tetap membulat
                child: const Image(
                  image: AssetImage('assets/Image/Carouselhome.png'),
                  fit: BoxFit
                      .cover, // Menyesuaikan gambar agar memenuhi seluruh container
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kategori',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi untuk melihat semua kategori
                  },
                  child: const Text('Lihat semua'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(title: 'Sedotan', onTap: () {}),
                  const SizedBox(width: 10),
                  CategoryItem(title: 'Sikat Gigi', onTap: () {}),
                  const SizedBox(width: 10),
                  CategoryItem(title: 'Gelas', onTap: () {}),
                  const SizedBox(width: 10),
                  CategoryItem(title: 'Tas', onTap: () {}),
                  const SizedBox(width: 10),
                  CategoryItem(title: 'Alat makan', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Produk Terlaris
            const Text(
              'Produk Terlaris',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Produk
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductItem(
                    title: 'Sikat Gigi',
                    price: 'Rp 20.000',
                    imageUrl: 'assets/image/sikatgigi.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            title: 'Sikat Gigi',
                            price: 'Rp 20.000',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductItem(
                    title: 'Botol Minum',
                    price: 'Rp 20.000',
                    imageUrl: 'assets/image/botolminum.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            title: 'Botol Minum',
                            price: 'Rp 20.000',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductItem(
                    title: 'Gelas',
                    price: 'Rp 100.000',
                    imageUrl: 'assets/image/gelas.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            title: 'Gelas',
                            price: 'Rp 100.000',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductItem(
                    title: 'Tas Belanja',
                    price: 'Rp 50.000',
                    imageUrl: 'assets/image/tas_belanja.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            title: 'Tas Belanja',
                            price: 'Rp 50.000',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
