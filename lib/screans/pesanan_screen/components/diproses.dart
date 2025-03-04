import 'package:flutter/material.dart';

import '../../../themes/color_scheme.dart';
import '../../../themes/text_theme.dart';

class Diproses extends StatelessWidget {
  final String title;

  const Diproses({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            DiprosesCard(onTap: () {}),
            const SizedBox(height: 15),
            DiprosesCard(onTap: () {}),
            const SizedBox(height: 15),
            DiprosesCard(onTap: () {}),
            const SizedBox(height: 15),
            DiprosesCard(onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class DiprosesCard extends StatelessWidget {
  final VoidCallback? onTap;
  const DiprosesCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 198,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: warning00,
                ),
                child: Text(
                  'Diproses',
                  style: regularBody3.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 68,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Image.asset(
                        'assets/image/sikatgigi.png',
                        width: 68,
                        height: 48,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sikat Gigi',
                            style: mediumBody2.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 1),
                        Text(
                          '1 Produk ',
                          style: regularBody3.copyWith(
                              fontSize: 12,
                              color: neutral30,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rp. 10.000',
                                style: boldBody2.copyWith(
                                  fontSize: 13,
                                  color: neutral40,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                'x1',
                                style: mediumBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 3),
                Text('Tampilkan produk lagi',
                    style: mediumBody3.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: neutral30)),
                const SizedBox(height: 3),
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1 Produk',
                          style: regularBody3.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Total produk : ',
                                style: semiBoldBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: 'Rp 20.000',
                                style: semiBoldBody3.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Penjual sedang memeriksa bukti \npembayaran',
                        style: regularBody4.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: neutral30,
                            height: 1.2)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
