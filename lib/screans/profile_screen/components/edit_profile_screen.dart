import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../../../models/user_profile.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routePath = '/edit-profile';

  final String initialName;
  final String initialEmail;
  final String initialPhone;
  final String initialProfileImage;

  const EditProfileScreen({
    Key? key,
    required this.initialName,
    required this.initialEmail,
    required this.initialPhone,
    required this.initialProfileImage,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _emailController = TextEditingController(text: widget.initialEmail);
    _phoneController = TextEditingController(text: widget.initialPhone);
    
    if (widget.initialProfileImage.startsWith('/')) {
      _imageFile = File(widget.initialProfileImage);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  ImageProvider _getProfileImage() {
    if (_imageFile != null) {
      return FileImage(_imageFile!);
    }
    if (widget.initialProfileImage.startsWith('/')) {
      return FileImage(File(widget.initialProfileImage));
    }
    if (widget.initialProfileImage.isNotEmpty) {
      return AssetImage(widget.initialProfileImage);
    }
    return const AssetImage('assets/image/profile.jpg');
  }

  Future<void> _updateProfileImage() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Izin akses galeri diperlukan')),
        );
      }
      return;
    }

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengubah foto profil')),
        );
      }
    }
  }

  bool _isDataChanged() {
    return _nameController.text != widget.initialName ||
        _emailController.text != widget.initialEmail ||
        _phoneController.text != widget.initialPhone ||
        _imageFile?.path != widget.initialProfileImage;
  }

  Future<bool> _onWillPop() async {
    if (_isDataChanged()) {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Batalkan perubahan?'),
          content: const Text('Perubahan yang belum disimpan akan hilang.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Ya'),
            ),
          ],
        ),
      );
    }
    return true;
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final updatedProfile = UserProfile(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        profileImage: _imageFile?.path ?? widget.initialProfileImage,
      );

      Navigator.pop(context, updatedProfile);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menyimpan profil')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
  backgroundColor: Color(0xff25745A),
  title: const Text('Edit Profil'),
  centerTitle: true,
  titleTextStyle: TextStyle(color: Colors.white),  // Ganti dengan TextStyle yang benar
),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _getProfileImage(),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff25745A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: _updateProfileImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                    TextFormField(
  controller: _nameController,
  decoration: const InputDecoration(
    labelText: 'Nama Lengkap',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person), // Ikon untuk nama
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  },
),
const SizedBox(height: 16),
TextFormField(
  controller: _emailController,
  decoration: const InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.email), // Ikon untuk email
  ),
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || !value.contains('@')) {
      return 'Email tidak valid';
    }
    return null;
  },
),
const SizedBox(height: 16),
TextFormField(
  controller: _phoneController,
  decoration: const InputDecoration(
    labelText: 'Nomor Telepon',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.phone), // Ikon untuk telepon
  ),
  keyboardType: TextInputType.phone,
  validator: (value) {
    if (value == null || value.length < 10) {
      return 'Nomor telepon tidak valid';
    }
    return null;
  },
),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xff25745A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}  