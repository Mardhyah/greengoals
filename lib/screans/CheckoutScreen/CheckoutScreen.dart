import 'package:flutter/material.dart';
import 'package:greengoals/screans/CheckoutScreen/components/address_information.dart';
import 'package:greengoals/screans/CheckoutScreen/components/detail_payment_total.dart';
import 'package:greengoals/screans/CheckoutScreen/components/order_information.dart';
import 'package:greengoals/screans/CheckoutScreen/components/payment_method_checkout.dart';
import 'package:greengoals/screans/CheckoutScreen/components/transport_information.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routePath = '/checkout-screen';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Keranjang',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          AddressInfomation(),
          OrderInformation(),
          TransportInformation(),
          PaymentMethodCheckout(),
          DetailPaymentTotal(),
        ],
      ),
    );
  }
}
