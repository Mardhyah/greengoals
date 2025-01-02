import 'package:flutter/material.dart';
import 'package:greengoals/models/address_model.dart';

class AddAddressScreen extends StatefulWidget {
  static const String routePath = '/add-address-screen';

  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isPrimary = false;

  void _submitAddress() {
    if (_formKey.currentState!.validate()) {
      final newAddress = AddressModel(
        name: _nameController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        isPrimary: _isPrimary,
      );
      Navigator.of(context).pop(newAddress); // Kirim alamat kembali ke AddressScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Alamat'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Input untuk Nama Lengkap
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input untuk Nomor Telepon
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Input untuk Alamat
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Switch untuk menandai alamat utama
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Set sebagai Alamat Utama'),
                  Switch(
                    value: _isPrimary,
                    onChanged: (value) {
                      setState(() {
                        _isPrimary = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Tombol Simpan Alamat
              ElevatedButton(
                onPressed: _submitAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Simpan Alamat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
