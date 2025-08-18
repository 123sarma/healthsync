import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../routes/app_routes.dart';

class DoctorUploadDocumentsScreen extends StatefulWidget {
  const DoctorUploadDocumentsScreen({super.key});

  @override
  State<DoctorUploadDocumentsScreen> createState() => _DoctorUploadDocumentsScreenState();
}

class _DoctorUploadDocumentsScreenState extends State<DoctorUploadDocumentsScreen> {
  static const Color deepPurple = Color(0xFF8A56AC);

  File? _profileImage;
  File? _certificateFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickProfileImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _profileImage = File(pickedFile.path));
    }
  }

  Future<void> _pickCertificate() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
    if (pickedFile != null) {
      setState(() => _certificateFile = File(pickedFile.path));
    }
  }

  void _submitDocuments() {
    if (_profileImage == null || _certificateFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please upload both profile image and certificate")),
      );
      return;
    }

    Navigator.pushNamed(context, AppRoutes.doctorVerification);
  }

  Widget _buildUploadSection({
    required String title,
    required String buttonText,
    required File? file,
    required VoidCallback onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: deepPurple),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: deepPurple),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_file, color: deepPurple),
                const SizedBox(width: 10),
                Text(
                  file != null ? "File Selected" : buttonText,
                  style: TextStyle(
                    color: file != null ? Colors.green : deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Upload Documents",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
                            'assets/images/icon5.png',
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildUploadSection(
                  title: "Upload Profile Image",
                  buttonText: "Choose Profile Picture",
                  file: _profileImage,
                  onPressed: _pickProfileImage,
                ),
                _buildUploadSection(
                  title: "Upload your verified degree!",
                  buttonText: "Choose Certificate",
                  file: _certificateFile,
                  onPressed: _pickCertificate,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitDocuments,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Complete Registration",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
