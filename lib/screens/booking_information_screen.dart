import 'package:flutter/material.dart';

class BookingInformationScreen extends StatelessWidget {
  const BookingInformationScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Booking Information",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        // Optional: Uncomment below to include the stethoscope icon
        /*
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/images/icon4.png', // purple stethoscope icon
              height: 32,
              width: 32,
            ),
          ),
        ],
        */
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("Patient Information", {
              "Name": "John Doe",
              "Age": "30",
              "Gender": "Male",
              "Contact": "03001234567"
            }),
            const SizedBox(height: 20),
            _buildSection("Doctor Information", {
              "Name": "Dr. Sarah Ahmed",
              "Designation": "Dermatologist",
              "Degree": "MBBS, FCPS"
            }),
            const SizedBox(height: 20),
            _buildSection("Booking Details", {
              "Appointment ID": "#APT-1223",
              "Date": "2025-05-25",
              "Time": "2:00 PM",
              "Type": "Online"
            }),
            const SizedBox(height: 20),
            _buildSection("Payment Information", {
              "Consulting Fee": "Rs. 1500",
              "Tax Charges": "Rs. 150",
              "Discount": "Rs. 100",
              "Payable Amount": "Rs. 1550",
              "Status": "Paid"
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Map<String, String> data) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            ...data.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      entry.value,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
