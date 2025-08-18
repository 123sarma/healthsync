import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddBankDetailsScreen extends StatefulWidget {
  const AddBankDetailsScreen({super.key});

  @override
  State<AddBankDetailsScreen> createState() => _AddBankDetailsScreenState();
}

class _AddBankDetailsScreenState extends State<AddBankDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();

  File? _cancelledChequeImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _cancelledChequeImage = File(picked.path);
      });
    }
  }

  void _saveDetails() {
    if (_formKey.currentState!.validate() && _cancelledChequeImage != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Bank details saved successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
    } else if (_cancelledChequeImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload a cancelled cheque photo')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Enter $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8A56AC),
        elevation: 0,
        title: const Text("Add Bank Details", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(label: 'Bank Name', controller: _bankNameController),
              const SizedBox(height: 16),
              _buildTextField(label: 'Account Holder Name', controller: _accountHolderController),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Account Number',
                controller: _accountNumberController,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              _buildTextField(label: 'IFSC Code', controller: _ifscCodeController),
              const SizedBox(height: 16),
              _buildTextField(label: 'Branch Name', controller: _branchNameController),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.upload_file),
label: const Text(
  "Upload Cancelled Cheque",
  style: TextStyle(color: Colors.white),
),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8A56AC),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _cancelledChequeImage != null
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.warning_amber, color: Colors.orange),
                ],
              ),
              if (_cancelledChequeImage != null) ...[
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(_cancelledChequeImage!, height: 150),
                ),
              ],
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8A56AC),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Save Details', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
