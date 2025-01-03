import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';

class AddressInfomation extends StatefulWidget {
  const AddressInfomation({super.key});

  @override
  State<AddressInfomation> createState() => _AddressInfomationState();
}

class _AddressInfomationState extends State<AddressInfomation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
          height: 48,
          width: double.infinity,
          child: const Text(
            'Informasi Pengiriman',
            style: semiBoldBody7,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/image/CheckoutPinpoint.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Alamat Pengiriman',
                    style: mediumBody8,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //NAMA ALAMAT
                  Padding(
                    padding: EdgeInsets.only(
                      left: 27,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mardhyah Fathania Izzati',
                          style: mediumBody8,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0812-8473-0000 | Jln. Jaga Mada B no.12 ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: mediumBody8,
                        ),
                        Text(
                          'AIR TAWAR BARAT, PADANG, SUMATERA BARAT. \nID 12344',
                          style: mediumBody8,
                        )
                      ],
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color.fromRGBO(37, 116, 90, 1),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
