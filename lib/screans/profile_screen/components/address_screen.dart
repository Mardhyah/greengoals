import 'package:flutter/material.dart';
import 'package:greengoals/models/address_model.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatefulWidget {
  static const String routePath = '/address-screen';

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final List<AddressModel> _addresses = [];

  void _addAddress(AddressModel address) {
    setState(() {
      _addresses.add(address);
    });
  }

  void _removeAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat'),
        centerTitle: true,
      ),
      body: _addresses.isEmpty
          ? Center(
              child: TextButton.icon(
                onPressed: () async {
                  final result = await Navigator.of(context).pushNamed(
                    AddAddressScreen.routePath,
                  );
                  if (result != null && result is AddressModel) {
                    _addAddress(result);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Tambah Alamat'),
              ),
            )
          : Column(
              children: [
                // Tampilkan Alamat yang sudah diisi
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      for (var address in _addresses)
                        Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: const Icon(Icons.verified_user),
                            title: Text(address.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.phone, size: 16),
                                    const SizedBox(width: 8),
                                    Text(address.phone),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16),
                                    const SizedBox(width: 8),
                                    Text(address.address),
                                  ],
                                ),
                                if (address.isPrimary)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'Alamat Utama',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _removeAddress(_addresses.indexOf(address)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Tombol untuk tambah alamat
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.of(context).pushNamed(
                        AddAddressScreen.routePath,
                      );
                      if (result != null && result is AddressModel) {
                        _addAddress(result);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Tambah Alamat'),
                  ),
                ),
              ],
            ),
    );
  }
}
