import 'package:flutter/material.dart';
import 'my_profile_screen.dart'; 
import 'package:health_sync/screens/doctor_my_appointments_screen.dart';
import 'package:health_sync/routes/app_routes.dart'; 

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    // Dummy user data — replace with real data from auth/user state
    const String doctorUsername = 'Dr. John Doe';
    const String doctorEmail = 'john.doe@example.com';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: const Text('Doctor Dashboard'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/images/icon5.png',
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Doctor!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: deepPurple,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDashboardCard(context, Icons.person, 'View Profile', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfileScreen(
                          username: doctorUsername,
                          email: doctorEmail,
                        ),
                      ),
                    );
                  }),
                  _buildDashboardCard(context, Icons.calendar_today, 'Appointments', () {
                    Navigator.pushNamed(context, AppRoutes.doctorMyAppointmentsScreen);
                  }),
                  _buildDashboardCard(context, Icons.edit_calendar, 'Edit Availability', () {
                    // Navigate to Availability
                  }),
                  _buildDashboardCard(context, Icons.monetization_on, 'Revenue', () {
                    // Navigate to Revenue
                  }),
                  _buildDashboardCard(context, Icons.chat, 'Chat', () {
                    // Navigate to Chat
                  }),
                  _buildDashboardCard(context, Icons.logout, 'Logout', () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.roleSelectionScreen,
                      (route) => false,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        shadowColor: deepPurple.withOpacity(0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: deepPurple),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
