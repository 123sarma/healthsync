import 'package:flutter/material.dart';
//import 'package:health_snyc/screens/RescheduleAppointmentScreen.dart';
import 'RescheduleAppointmentScreen.dart'; 


class ViewAppointmentsScreen extends StatelessWidget {
  const ViewAppointmentsScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Appointments"),
          centerTitle: true,
          backgroundColor: deepPurple,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingAppointmentsTab(),
            CompletedAppointmentsTab(),
            CancelledAppointmentsTab(),
          ],
        ),
      ),
    );
  }
}

class PendingAppointmentsTab extends StatelessWidget {
  const PendingAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _appointmentCard(
          context,
          doctorName: "Dr. Ayesha Khan",
          doctorImage: "assets/images/doctor1.jpg",
          specialty: "Dermatologist",
          date: "June 12, 2025",
          time: "10:00 AM",
        ),
        const SizedBox(height: 16),
        _appointmentCard(
          context,
          doctorName: "Dr. Hassan Raza",
          doctorImage: "assets/images/doctor1.jpg",
          specialty: "Cardiologist",
          date: "June 14, 2025",
          time: "3:30 PM",
        ),
      ],
    );
  }

  static Widget _appointmentCard(BuildContext context,
      {required String doctorName,
      required String doctorImage,
      required String specialty,
      required String date,
      required String time}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(doctorImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ViewAppointmentsScreen.deepPurple)),
                  const SizedBox(height: 4),
                  Text(specialty, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(date),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(time),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showCancelDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RescheduleAppointmentScreen(
                                doctorName: doctorName,
                                specialty: specialty,
                                currentDate: date,
                                currentTime: time,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ViewAppointmentsScreen.deepPurple,
                        ),
                        child: const Text(
                          "Re-schedule",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static void _showCancelDialog(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Appointment Cancel"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Please enter the reason for cancelling:"),
            const SizedBox(height: 10),
            TextField(
              controller: reasonController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Reason...",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // close the dialog
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Success"),
                  content: const Text("Appointment cancelled successfully."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // close success dialog
                        Navigator.of(context).pop(); // return to view screen
                      },
                      child: const Text("Close"),
                    )
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Text("Cancel Appointment",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class CompletedAppointmentsTab extends StatelessWidget {
  const CompletedAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No completed appointments."));
  }
}

class CancelledAppointmentsTab extends StatelessWidget {
  const CancelledAppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No cancelled appointments."));
  }
}
