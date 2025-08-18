import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  static const Color deepPurple = Color(0xFF8A56AC);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();

  String? _selectedBankAccount;
  bool _isAddingNewBank = false;

  // Mock data for existing bank accounts
  final List<String> _existingBankAccounts = [
    'Bank of Flutter - 1234567890',
    'Dart National Bank - 0987654321',
  ];

  double _totalBalance = 5000.00; // Example balance

  void _submitWithdrawal() {
    if (_formKey.currentState!.validate()) {
      // Process the withdrawal logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Withdrawal request submitted successfully!')),
      );
      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _isAddingNewBank = false;
        _selectedBankAccount = null;
      });
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
        title: const Text('Withdraw'),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Total Balance Display
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: deepPurple),
                  title: const Text('Total Balance'),
                  subtitle: Text('PKR ${_totalBalance.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: deepPurple)),
                ),
              ),
              const SizedBox(height: 20),
              // Amount Entry
              _buildTextField(
                label: 'Enter Amount',
                controller: _amountController,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // Bank Account Selection
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Bank Account',
                  border: OutlineInputBorder(),
                ),
                items: _existingBankAccounts
                    .map((account) => DropdownMenuItem(
                          value: account,
                          child: Text(account),
                        ))
                    .toList(),
                value: _selectedBankAccount,
                onChanged: (value) {
                  setState(() {
                    _selectedBankAccount = value;
                    _isAddingNewBank = false;
                  });
                },
                validator: (value) {
                  if (!_isAddingNewBank && (value == null || value.isEmpty)) {
                    return 'Please select a bank account or add new';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Add New Bank Details Toggle
              Row(
                children: [
                  Checkbox(
                    value: _isAddingNewBank,
                    onChanged: (value) {
                      setState(() {
                        _isAddingNewBank = value ?? false;
                        if (_isAddingNewBank) {
                          _selectedBankAccount = null;
                        }
                      });
                    },
                  ),
                  const Text('Add New Bank Details'),
                ],
              ),
              const SizedBox(height: 10),
              // New Bank Details Entry
              if (_isAddingNewBank) ...[
                _buildTextField(label: 'Bank Name', controller: _bankNameController),
                const SizedBox(height: 10),
                _buildTextField(label: 'Account Holder Name', controller: _accountHolderController),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Account Number',
                  controller: _accountNumberController,
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                _buildTextField(label: 'IBAN Number', controller: _ibanController),
                const SizedBox(height: 20),
              ],
              // Submit Button
              ElevatedButton(
                onPressed: _submitWithdrawal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Withdraw', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
