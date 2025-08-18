import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // Make sure route constants are defined here

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        title: const Text('Patient Dashboard'),
        centerTitle: true,
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
              'Welcome, Patient!',
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
                  _buildDashboardCard(context, Icons.home, 'Home', () {
                   Navigator.pushNamed(context, AppRoutes.patientHomeScreen);
                  }),
                  _buildDashboardCard(context, Icons.person, 'Profile', () {
                   Navigator.pushNamed(context, AppRoutes.patientProfileScreen);
                  }),
                   _buildDashboardCard(context, Icons.calendar_month, 'Appointment', () {
                   Navigator.pushNamed(context, AppRoutes.viewAppointmentsScreen);
                  }),
                  _buildDashboardCard(context, Icons.play_circle_fill, 'Med Clips', () {
                   // Navigator.pushNamed(context, AppRoutes.medClips);
                  }),
                  _buildDashboardCard(context, Icons.chat, 'Chat', () {
                   // Navigator.pushNamed(context, AppRoutes.chatScreen);
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
