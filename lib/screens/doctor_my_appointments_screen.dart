import 'package:flutter/material.dart';
import 'package:health_sync/routes/app_routes.dart';

class DoctorMyAppointmentsScreen extends StatelessWidget {
  const DoctorMyAppointmentsScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: deepPurple,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'My Appointments',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: deepPurple,
              child: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'Pending'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PendingAppointmentsTab(),
                  Center(child: Text('Completed Appointments')),
                  Center(child: Text('Cancelled Appointments')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingAppointmentsTab extends StatelessWidget {
  const PendingAppointmentsTab({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3, // Replace with real data
      itemBuilder: (context, index) => Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/patient.webp',
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Patient: John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Date: 2025-05-25   Time: 2:00 PM"),
                    const Text("Type: Online"),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _actionButton(context, "Check In", () => _showCheckInDialog(context)),
                          const SizedBox(width: 8),
                          _actionButton(context, "Check Out", () {}),
                          const SizedBox(width: 8),
                          _actionButton(context, "Cancel", () {
                            Navigator.pushNamed(context, AppRoutes.doctorCancelAppointmentScreen);
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _actionButton(BuildContext context, String label, VoidCallback onPressed) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: deepPurple),
        backgroundColor: deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }

  static void _showCheckInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Check In"),
        content: const Text("Do you want to check in now?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamed(context, AppRoutes.bookingInformationScreen);
            },
            child: const Text("Check In"),
          ),
        ],
      ),
    );
  }
}
