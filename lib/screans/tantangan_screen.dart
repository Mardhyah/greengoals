import 'package:flutter/material.dart';

import '../themes/color_scheme.dart';
import '../themes/text_theme.dart';

class TantanganScreen extends StatefulWidget {
  const TantanganScreen({super.key});

  @override
  State<TantanganScreen> createState() => _TantanganScreenState();
}

class _TantanganScreenState extends State<TantanganScreen> {
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
    );
  }
}
