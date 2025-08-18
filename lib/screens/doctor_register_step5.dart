import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DoctorRegisterStep5 extends StatefulWidget {
  const DoctorRegisterStep5({super.key});

  @override
  State<DoctorRegisterStep5> createState() => _DoctorRegisterStep5State();
}

class _DoctorRegisterStep5State extends State<DoctorRegisterStep5> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _availableFromController = TextEditingController();
  final TextEditingController _availableToController = TextEditingController();

  static const Color deepPurple = Color(0xFF8A56AC);

  void _continueToNext() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.doctorRegisterStep6);
    }
  }

  @override
  void dispose() {
    _availableFromController.dispose();
    _availableToController.dispose();
    super.dispose();
  }

  Widget _buildTimeField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      validator: (value) => value == null || value.isEmpty ? "Required field" : null,
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          controller.text = pickedTime.format(context);
        }
      },
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
        suffixIcon: const Icon(Icons.access_time, color: deepPurple),
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
                      "Availability Timings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTimeField("Available From", _availableFromController),
                  const SizedBox(height: 16),
                  _buildTimeField("Available To", _availableToController),
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
