import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:greengoals/models/address_model.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatefulWidget {
  static const String routePath = '/address-screen';

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<AddressModel> _addresses = [];

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedAddresses = prefs.getString('addresses');
    if (savedAddresses != null) {
      final List<dynamic> addressList = json.decode(savedAddresses);
      setState(() {
        _addresses = addressList.map((jsonItem) => AddressModel.fromJson(jsonItem)).toList();
      });
    }
  }

  Future<void> _saveAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedAddresses =
        json.encode(_addresses.map((address) => address.toJson()).toList());
    await prefs.setString('addresses', encodedAddresses);
  }

  void _addAddress(AddressModel address) {
    setState(() {
      _addresses.add(address);
    });
    _saveAddresses(); // Simpan setelah menambah alamat
  }

  void _removeAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
    _saveAddresses(); // Simpan setelah menghapus alamat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Latar belakang lebih terang
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Alamat',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
        elevation: 0, // Hilangkan bayangan bawah app bar
      ),
      body: Stack(
        children: [
          // Daftar alamat
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: _addresses.length,
            itemBuilder: (context, index) {
              final address = _addresses[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut yang lebih lembut
                ),
                shadowColor: Colors.black.withOpacity(0.1), // Efek bayangan yang halus
                elevation: 3, // Menambahkan sedikit bayangan
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primary40.withOpacity(0.5), // Warna border
                        width: 1, // Ketebalan garis border
                      ),
                      borderRadius: BorderRadius.circular(12), // Sudut border yang lembut
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, color: Color(0xff25745A)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                address.phone,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                address.address,
                                style: const TextStyle(fontSize: 14),
                              ),
                              if (address.isPrimary)
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff25745A),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Alamat Utama',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeAddress(index),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // Tombol tambah alamat
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.of(context)
                    .pushNamed(AddAddressScreen.routePath);
                if (result != null && result is AddressModel) {
                  _addAddress(result);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff25745A),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Menambahkan sudut pada tombol
                ),
                elevation: 5, // Memberikan sedikit bayangan pada tombol
              ),
              child: const Text(
                'Tambah Alamat',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
