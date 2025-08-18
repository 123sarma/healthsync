import 'package:flutter/material.dart';

class DoctorCancelAppointmentScreen extends StatefulWidget {
  const DoctorCancelAppointmentScreen({super.key});

  @override
  State<DoctorCancelAppointmentScreen> createState() => _DoctorCancelAppointmentScreenState();
}

class _DoctorCancelAppointmentScreenState extends State<DoctorCancelAppointmentScreen> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color deepPurple = Color(0xFF8A56AC);
    const Color redColor = Colors.red;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: const Text(
          'Cancel Appointment',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Reason for Cancellation",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: deepPurple,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _reasonController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write the reason here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                String reason = _reasonController.text.trim();
                if (reason.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a reason.")),
                  );
                  return;
                }

                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Cancel Appointment",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context); // Just close and go back
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: deepPurple,
                side: const BorderSide(color: deepPurple),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
