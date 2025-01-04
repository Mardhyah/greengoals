import 'package:flutter/material.dart';
import 'package:greengoals/screans/CheckoutScreen/CheckoutScreen.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required String title, required String price})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0;
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      "assets/image/sikatgigi2.jpg",
      "assets/image/sikatgigi2.jpg",
      "assets/image/sikatgigi2.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Detail Produk',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: PageView.builder(
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              images[index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 0,
                    right: 0,
                    child: CarouselIndicator(
                      itemCount: images.length,
                      currentIndex: currentIndex,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitle(),
                    const SizedBox(height: 20.0),
                    ProductDescription(
                      isExpanded: isExpanded,
                      toggleExpanded: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Produk Lainnya",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: OtherProduct(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(),
                    const UlasanSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
                label: const Text(
                  "",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary40,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Beli Sekarang",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const CarouselIndicator({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          width: 12.0,
          height: 12.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == currentIndex)
                ? Colors.black.withOpacity(0.9)
                : Colors.black.withOpacity(0.4),
          ),
        );
      }),
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sikat Gigi",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, size: 20, color: Colors.amber),
            Icon(Icons.star, size: 20, color: Colors.amber),
            Icon(Icons.star, size: 20, color: Colors.amber),
            Icon(Icons.star_half, size: 20, color: Colors.amber),
            Icon(Icons.star_border, size: 20, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback toggleExpanded;

  const ProductDescription({
    Key? key,
    required this.isExpanded,
    required this.toggleExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Deskripsi Produk",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem.",
          maxLines: isExpanded ? 6 : null,
          overflow: isExpanded ? TextOverflow.ellipsis : null,
          style: const TextStyle(fontSize: 14.0, height: 1.5),
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
          onTap: toggleExpanded,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isExpanded ? "Selengkapnya" : "Sembunyikan",
                style: const TextStyle(color: Colors.black),
              ),
              Icon(
                isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UlasanSection extends StatelessWidget {
  const UlasanSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ulasan",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "100 Ulasan",
              style: TextStyle(fontSize: 10.0),
            ),
          ],
        ),
        Row(
          children: [
            Text("Lihat Semua", style: TextStyle(fontSize: 10.0)),
            Icon(Icons.arrow_forward_ios, size: 10.0),
          ],
        ),
      ],
    );
  }
}

class OtherProduct extends StatelessWidget {
  const OtherProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.network('https://picsum.photos/110',
                height: 100, width: 110, fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.all(6.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Totebag Kanvas',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Rp 20.000-',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
