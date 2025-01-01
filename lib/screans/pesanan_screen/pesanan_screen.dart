import 'package:flutter/material.dart';

import '../../themes/color_scheme.dart';
import '../../themes/text_theme.dart';
import 'components/diproses.dart';
import 'components/menunggu_pesanan.dart';

class PesananScreen extends StatelessWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Pesanan',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints.expand(height: 50),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Text('Menunggu Konfirmasi',
                            style: TextStyle(fontSize: 13))),
                    Tab(child: Text('Proses', style: TextStyle(fontSize: 13))),
                    Tab(child: Text('Dikirim', style: TextStyle(fontSize: 13))),
                    Tab(child: Text('Selesai', style: TextStyle(fontSize: 13))),
                    Tab(child: Text('Gagal', style: TextStyle(fontSize: 13))),
                  ],
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  WaitingConfirmationTab(title: 'Menunggu Konfirmasi'),
                  Diproses(title: 'Menunggu Konfirmasi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
