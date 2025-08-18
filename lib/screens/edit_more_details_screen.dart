import 'package:flutter/material.dart';

class EditMoreDetailsScreen extends StatefulWidget {
  const EditMoreDetailsScreen({super.key});

  @override
  State<EditMoreDetailsScreen> createState() => _EditMoreDetailsScreenState();
}

class _EditMoreDetailsScreenState extends State<EditMoreDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;
  final TextEditingController designationController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepPurple,
        centerTitle: true,
        title: const Text(
          "Edit More Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            shadowColor: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildDropdown("Select Category", ['General', 'Specialist', 'Surgeon'], selectedCategory, (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    }),
                    _buildTextField("Designation", designationController),
                    _buildTextField("Degree", degreeController),
                    _buildTextField("Experience", experienceController),
                    _buildTextField("Consultation Fee", feeController),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                          }
                        },
                        child: const Text("Save Profile", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: deepPurple),
          prefixIcon: const Icon(Icons.edit, color: deepPurple),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: deepPurple, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) => value == null || value.isEmpty ? 'This field is required' : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedItem, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: deepPurple),
          prefixIcon: const Icon(Icons.arrow_drop_down, color: deepPurple),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: deepPurple, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select $label' : null,
      ),
    );
  }
}
