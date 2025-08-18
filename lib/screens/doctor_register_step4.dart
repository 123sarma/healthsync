import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DoctorRegisterStep4 extends StatefulWidget {
  const DoctorRegisterStep4({super.key});

  @override
  State<DoctorRegisterStep4> createState() => _DoctorRegisterStep4State();
}

class _DoctorRegisterStep4State extends State<DoctorRegisterStep4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _clinicAddressController = TextEditingController();
  final TextEditingController _clinicCityController = TextEditingController();

  static const Color deepPurple = Color(0xFF8A56AC);

  bool _hasClinic = false;
  bool _hasOnline = false;

  void _continueToNext() {
    if (!_hasClinic && !_hasOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one option: Clinic or Online')),
      );
      return;
    }

    if (_hasClinic) {
      if (_formKey.currentState!.validate()) {
        Navigator.pushNamed(context, AppRoutes.doctorRegisterStep5);
      }
    } else {
      // No clinic info needed, so just continue
      Navigator.pushNamed(context, AppRoutes.doctorRegisterStep5);
    }
  }

  @override
  void dispose() {
    _clinicNameController.dispose();
    _clinicAddressController.dispose();
    _clinicCityController.dispose();
    super.dispose();
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType type) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) {
        if (_hasClinic) {
          return (value == null || value.isEmpty) ? "Required field" : null;
        }
        return null;
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
      ),
    );
  }

  Widget _buildOptionsCheckboxes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Services Offered",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: deepPurple,
          ),
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          title: const Text("Clinic"),
          activeColor: deepPurple,
          value: _hasClinic,
          onChanged: (value) {
            setState(() {
              _hasClinic = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Text("Online"),
          activeColor: deepPurple,
          value: _hasOnline,
          onChanged: (value) {
            setState(() {
              _hasOnline = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOptionsCheckboxes(),
                  if (_hasClinic) ...[
                    const SizedBox(height: 24),
                    const Text(
                      "Clinic Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: deepPurple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField("Clinic Name", _clinicNameController, TextInputType.text),
                    const SizedBox(height: 16),
                    _buildTextField("Clinic Address", _clinicAddressController, TextInputType.streetAddress),
                    const SizedBox(height: 16),
                    _buildTextField("City", _clinicCityController, TextInputType.text),
                  ],
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
