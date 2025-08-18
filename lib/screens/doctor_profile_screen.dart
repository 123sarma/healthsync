import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  final String name;
  final String specialty;
  final String imagePath;
  final String rating;
  final String clinicAddress;
  final String experience;
  final String happyPatients;
  final String reviews;
  final String aboutMe;
  final List<String> services;
  final List<String> expertise;
  final String workingTime;

  const DoctorProfileScreen({
    super.key,
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.rating,
    required this.clinicAddress,
    required this.experience,
    required this.happyPatients,
    required this.reviews,
    required this.aboutMe,
    required this.services,
    required this.expertise,
    required this.workingTime,
  });

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        title: const Text("Doctor Profile"),
        backgroundColor: deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
                const SizedBox(height: 12),
                Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(specialty, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(color: Colors.orange, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionCard([
            _infoTile(Icons.location_on, "Clinic Address", clinicAddress),
            _infoTile(Icons.timeline, "Experience", experience),
            _infoTile(Icons.people, "Happy Patients", happyPatients),
            _infoTile(Icons.reviews, "Reviews", reviews),
            _infoTile(Icons.access_time, "Working Time", workingTime),
          ]),
          const SizedBox(height: 16),
          _buildTextCard("About Me", aboutMe),
          _buildTextCard("Services", services.map((e) => "• $e").join("\n")),
          _buildTextCard("Expertise", expertise.map((e) => "• $e").join("\n")),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.calendar_month),
              label: const Text("Book Appointment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Booking screen coming soon...")),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: deepPurple, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard(String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: deepPurple)),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontSize: 15, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
