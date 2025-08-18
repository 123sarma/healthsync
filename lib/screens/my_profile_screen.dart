import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'edit_profile_screen.dart';
import 'attendance_screen.dart'; 
import 'withdraw_screen.dart'; 
import 'package:health_sync/routes/app_routes.dart';

class MyProfileScreen extends StatefulWidget {
  final String username;
  final String email;

  const MyProfileScreen({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  static const Color deepPurple = Color(0xFF8A56AC);
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildOptionCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: deepPurple.withOpacity(0.2),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: deepPurple),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: deepPurple.withOpacity(0.2),
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? const Icon(Icons.camera_alt, size: 32, color: deepPurple)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.username,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: deepPurple),
            ),
            const SizedBox(height: 8),
            Text(widget.email,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 16),
            //TextButton.icon(
                
  ElevatedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  },
  icon: const Icon(Icons.edit, color: Colors.white),
  label: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
  ),
),


            const SizedBox(height: 24),
            _buildOptionCard(
              icon: Icons.account_balance_wallet,
              title: 'My Wallet',
              onTap: () {
                 Navigator.pushNamed(context, AppRoutes.withdrawScreen);
              },
            ),
            _buildOptionCard(
              icon: Icons.access_time,
              title: 'My Attendance',
              onTap: () {
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => AttendanceScreen()),
);
              },
            ),
            _buildOptionCard(
              icon: Icons.account_balance,
              title: 'Add Bank Details',
              onTap: () {
Navigator.pushNamed(context, AppRoutes.addBankDetailsScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
