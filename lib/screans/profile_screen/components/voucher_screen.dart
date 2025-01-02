import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  static const String routePath = '/voucher';

  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voucher'),
      ),
      body: const Center(
        child: Text('Halaman Voucher'),
      ),
    );
  }
}
