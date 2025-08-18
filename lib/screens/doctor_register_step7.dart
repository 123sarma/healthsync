import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DoctorRegisterStep7 extends StatefulWidget {
  const DoctorRegisterStep7({super.key});

  @override
  State<DoctorRegisterStep7> createState() => _DoctorRegisterStep7State();
}

class _DoctorRegisterStep7State extends State<DoctorRegisterStep7> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _aboutController = TextEditingController();

  static const Color deepPurple = Color(0xFF8A56AC);

  void _submitRegistration() {
    if (_formKey.currentState!.validate()) {
      // Submit logic or navigation to dashboard/home
        Navigator.pushNamed(context, AppRoutes.doctorUploadDocumentsScreen);
    }
  }

  @override
  void dispose() {
    _aboutController.dispose();
    super.dispose();
  }

  Widget _buildAboutField() {
    return TextFormField(
      controller: _aboutController,
      maxLines: 5,
      validator: (value) => value == null || value.isEmpty ? "Required field" : null,
      decoration: InputDecoration(
        labelText: "Tell us about yourself",
        alignLabelWithHint: true,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: deepPurple, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
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
          "Complete Registration",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          shadowColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Short Bio",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildAboutField(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitRegistration,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
