import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/color_scheme.dart';
import '../../themes/text_theme.dart';

class ProfileScreen extends StatelessWidget {
  static const String routePath = '/profile-screen';
  const ProfileScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // WIDGET PROFILE
            Padding(
              padding: const EdgeInsets.only(
                  left: 31, right: 41, top: 18.5, bottom: 15),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 43,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bagus Aryandi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'bagusaryandi@gmail.com',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              '081223567789',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SvgPicture.asset('assets/image/profileTier.svg')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/image/editProfileButton.svg',
                    ),
                  ),
                ],
              ),
            ),

            // WIDGET KETERANGAN KONTRIBUSI DAN TANTANGAN

            const Divider(
              thickness: 1,
            ),

            // Widget Keterangan Kontribusi dan Tantangan
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset('assets/image/profileTantanganIcon.svg'),
                      const SizedBox(height: 10),
                      const Text(
                        '50 Tantangan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Tantangan Diikuti',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),

            Container(
              width: 339,
              height: 315,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/image/profilePersonEdit.svg'),
                          const SizedBox(
                            width: 18,
                          ),
                          const Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/image/profilePersonEdit.svg'),
                          const SizedBox(
                            width: 18,
                          ),
                          const Text(
                            'Alamat',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 25,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/image/profileTicketIcon.svg'),
                          const SizedBox(
                            width: 14,
                          ),
                          const Text(
                            'Voucher',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 25,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/image/profileSandiIcon.svg'),
                          const SizedBox(
                            width: 14,
                          ),
                          const Text(
                            'Ubah Kata Sandi',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 25,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/image/profileLogoutIcon.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Keluar',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
