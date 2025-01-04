import 'package:flutter/foundation.dart';

class AddressModel {
  final String name;
  final String phone;
  final String address;
  final bool isPrimary;

  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    this.isPrimary = false,
  });

  // Membuat konstruktor dari JSON (dari Map)
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      isPrimary: json['isPrimary'] ?? false, // Jika tidak ada, default false
    );
  }

  // Mengonversi objek AddressModel ke dalam format JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'isPrimary': isPrimary,
    };
  }
}
