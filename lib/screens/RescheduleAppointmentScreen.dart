import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RescheduleAppointmentScreen extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String currentDate;
  final String currentTime;

  const RescheduleAppointmentScreen({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.currentDate,
    required this.currentTime,
  });

  @override
  State<RescheduleAppointmentScreen> createState() =>
      _RescheduleAppointmentScreenState();
}

class _RescheduleAppointmentScreenState
    extends State<RescheduleAppointmentScreen> {
  static const Color deepPurple = Color(0xFF8A56AC);
  DateTime? selectedDate = DateTime.now().add(const Duration(days: 1));
  String? selectedTimeSlot;

  // Example: Booked time slots (this would come from backend)
  final List<String> bookedSlots = ['12:00 PM', '3:30 PM'];

  List<String> generateTimeSlots() {
    List<String> slots = [];
    TimeOfDay start = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay end = const TimeOfDay(hour: 17, minute: 0);

    while (start.hour < end.hour || (start.hour == end.hour && start.minute < end.minute)) {
      final timeStr = start.format(context);
      slots.add(timeStr);
      int totalMinutes = start.hour * 60 + start.minute + 30;
      start = TimeOfDay(hour: totalMinutes ~/ 60, minute: totalMinutes % 60);
    }
    return slots;
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        selectedTimeSlot = null;
      });
    }
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('EEE, dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = generateTimeSlots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        centerTitle: true,
        title: const Text("Reschedule Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.doctorName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: deepPurple)),
                    const SizedBox(height: 4),
                    Text(widget.specialty),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 4),
                        Text("Current: ${widget.currentDate}"),
                        const SizedBox(width: 16),
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 4),
                        Text(widget.currentTime),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Select new date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: deepPurple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: deepPurple),
                    const SizedBox(width: 10),
                    Text(getFormattedDate(selectedDate!),
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Select time slot",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: timeSlots.map((slot) {
                bool isBooked = bookedSlots.contains(slot);
                bool isSelected = selectedTimeSlot == slot;
                return ChoiceChip(
                  label: Text(slot),
                  selected: isSelected,
                  onSelected: isBooked
                      ? null
                      : (selected) {
                          setState(() {
                            selectedTimeSlot = selected ? slot : null;
                          });
                        },
                  backgroundColor: isBooked ? Colors.grey.shade300 : Colors.white,
                  selectedColor: deepPurple,
                  labelStyle: TextStyle(
                    color: isBooked
                        ? Colors.grey
                        : isSelected
                            ? Colors.white
                            : Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isBooked
                          ? Colors.grey
                          : isSelected
                              ? deepPurple
                              : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedTimeSlot == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please select a valid time slot."),
                    ));
                    return;
                  }

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Appointment Rescheduled"),
                      content: Text(
                          "Your appointment has been rescheduled to\n${getFormattedDate(selectedDate!)} at $selectedTimeSlot."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
               child: const Text(
  "Confirm Reschedule",
  style: TextStyle(
    fontSize: 16,
    color: Colors.white, // Text color changed to white
  ),
),

              ),
            )
          ],
        ),
      ),
    );
  }
}
