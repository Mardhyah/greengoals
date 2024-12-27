import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green[100],
            child: Icon(Icons.category, color: Colors.green),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
