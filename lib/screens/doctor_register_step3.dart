import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DoctorRegisterStep3 extends StatefulWidget {
  const DoctorRegisterStep3({super.key});

  @override
  State<DoctorRegisterStep3> createState() => _DoctorRegisterStep3State();
}

class _DoctorRegisterStep3State extends State<DoctorRegisterStep3> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _feesController = TextEditingController();

  static const Color deepPurple = Color(0xFF8A56AC);

  void _continueToNext() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.doctorRegisterStep4);
    }
  }

  @override
  void dispose() {
    _designationController.dispose();
    _degreeController.dispose();
    _experienceController.dispose();
    _feesController.dispose();
    super.dispose();
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType type) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) => value == null || value.isEmpty ? "Required field" : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          elevation: 4,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Professional Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Designation", _designationController, TextInputType.text),
                  const SizedBox(height: 16),
                  _buildTextField("Degree(s)", _degreeController, TextInputType.text),
                  const SizedBox(height: 16),
                  _buildTextField("Years of Experience", _experienceController, TextInputType.number),
                  const SizedBox(height: 16),
                  _buildTextField("Consultation Fees", _feesController, TextInputType.number),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _continueToNext,
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
