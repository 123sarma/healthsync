import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DoctorRegisterStep2 extends StatefulWidget {
  const DoctorRegisterStep2({super.key});

  @override
  State<DoctorRegisterStep2> createState() => _DoctorRegisterStep2State();
}

class _DoctorRegisterStep2State extends State<DoctorRegisterStep2> {
  String? selectedCategory;

  static const Color deepPurple = Color(0xFF8A56AC);

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.medical_services, "label": "General"},
    {"icon": Icons.mood, "label": "Dentist"},
    {"icon": Icons.remove_red_eye, "label": "Ophthalmology"},
    {"icon": Icons.local_dining, "label": "Nutrition"},
    {"icon": Icons.psychology, "label": "Neurology"},
    {"icon": Icons.child_care, "label": "Pediatrics"},
    {"icon": Icons.biotech, "label": "Radiology"},
    {"icon": Icons.sick, "label": "Hematology"},
    {"icon": Icons.bloodtype, "label": "Pathology"},
    {"icon": Icons.coronavirus, "label": "Oncologist"},
    {"icon": Icons.local_hospital, "label": "Gastroenterology"},
    {"icon": Icons.people, "label": "Physicians"},
    {"icon": Icons.accessibility, "label": "Orthopedist"},
    {"icon": Icons.air, "label": "Pulmonology"},
    {"icon": Icons.favorite, "label": "Cardiologist"},
  ];

  void _continueToNext() {
    if (selectedCategory != null) {
      Navigator.pushNamed(context, AppRoutes.doctorRegisterStep3);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a category")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Complete Registration",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
                            'assets/images/icon5.png',
              height: 32,
              width: 32,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          shadowColor: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: deepPurple,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 3.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    final item = categories[index];
                    final isSelected = selectedCategory == item['label'];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = item['label'];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? deepPurple : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? deepPurple : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 30,
                              color: isSelected ? Colors.white : deepPurple,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['label'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _continueToNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Your category isn’t available? Suggest Us",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
