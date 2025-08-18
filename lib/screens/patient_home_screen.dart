import 'package:flutter/material.dart';
import 'doctor_profile_screen.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Cardiology",
    "Dental",
    "Neurology",
    "Pediatrics",
    "Radiology",
    "General",
    "Ophthalmology",
  ];

  final List<Map<String, dynamic>> allDoctors = [
    {
      "name": "Dr. Adeel Khan",
      "specialty": "Cardiology",
      "rating": "4.7",
      "image": "assets/images/doctor1.jpg",
      "clinicAddress": "Al Shifa Hospital, Islamabad",
      "experience": "12 years",
      "happyPatients": "1,100+",
      "reviews": "250",
      "aboutMe": "Dedicated heart specialist helping patients with cardiovascular issues.",
      "services": ["ECG", "Heart Surgery", "Consultation"],
      "expertise": ["Cardiology", "Heart Failure", "Arrhythmia"],
      "workingTime": "Mon - Fri: 9AM - 2PM"
    },
    {
      "name": "Dr. Sarah Ali",
      "specialty": "Dental",
      "rating": "4.5",
      "image": "assets/images/doctor1.jpg",
      "clinicAddress": "Smile Care Clinic, Lahore",
      "experience": "8 years",
      "happyPatients": "900+",
      "reviews": "120",
      "aboutMe": "Expert in cosmetic dentistry and root canal treatments.",
      "services": ["Root Canal", "Teeth Whitening", "Braces"],
      "expertise": ["Dentistry", "Orthodontics", "Cosmetic Care"],
      "workingTime": "Tue - Sat: 10AM - 4PM"
    },
    {
      "name": "Dr. Usman Malik",
      "specialty": "Cardiology",
      "rating": "4.9",
      "image": "assets/images/doctor1.jpg",
      "clinicAddress": "Heart Center, Karachi",
      "experience": "15 years",
      "happyPatients": "1,500+",
      "reviews": "300",
      "aboutMe": "Renowned cardiologist known for successful surgeries.",
      "services": ["Bypass Surgery", "Consultation"],
      "expertise": ["Angioplasty", "Heart Disease"],
      "workingTime": "Mon - Fri: 8AM - 12PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String searchQuery = _searchController.text.toLowerCase();

    final List<Map<String, dynamic>> filteredDoctors = allDoctors.where((doctor) {
      final matchCategory = selectedCategory == "All" || doctor['specialty'] == selectedCategory;
      final matchSearch = doctor['name'].toLowerCase().contains(searchQuery);
      return matchCategory && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              // Greeting
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/patient.webp'),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello, Faiza Maqsood",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("How are you feeling today?",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: PatientHomeScreen.deepPurple),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'Search for Doctor...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Categories Grid
              const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1,
                children: const [
                  _CategoryItem(icon: Icons.people, label: "General"),
                  _CategoryItem(icon: Icons.biotech, label: "Radiology"),
                  _CategoryItem(icon: Icons.child_care, label: "Pediatrics"),
                  _CategoryItem(icon: Icons.remove_red_eye, label: "Ophthalmology"),
                  _CategoryItem(icon: Icons.psychology, label: "Neurology"),
                  _CategoryItem(icon: Icons.medical_services, label: "Dental"),
                  _CategoryItem(icon: Icons.favorite, label: "Cardiology"),
                ],
              ),
              const SizedBox(height: 20),

              // Doctor Filter Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Best Specialist", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View More", style: TextStyle(color: PatientHomeScreen.deepPurple)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: categories
                    .map((cat) => _tabChip(
                          cat,
                          selected: selectedCategory == cat,
                          onTap: () => setState(() => selectedCategory = cat),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Doctor Cards List
              if (filteredDoctors.isEmpty)
                const Center(child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text("No doctors found.", style: TextStyle(color: Colors.grey)),
                )),
              ...filteredDoctors.map((doc) => _doctorCard(context, doc)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _tabChip(String label, {bool selected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? PatientHomeScreen.deepPurple : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget _doctorCard(BuildContext context, Map<String, dynamic> doc) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DoctorProfileScreen(
              name: doc['name'],
              specialty: doc['specialty'],
              imagePath: doc['image'],
              rating: doc['rating'],
              clinicAddress: doc['clinicAddress'],
              experience: doc['experience'],
              happyPatients: doc['happyPatients'],
              reviews: doc['reviews'],
              aboutMe: doc['aboutMe'],
              services: List<String>.from(doc['services']),
              expertise: List<String>.from(doc['expertise']),
              workingTime: doc['workingTime'],
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(doc['image'])),
          title: Text(doc['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doc['specialty']),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text("${doc['rating']} Reviews", style: const TextStyle(color: Colors.orange)),
                ],
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: PatientHomeScreen.deepPurple.withOpacity(0.1),
          child: Icon(icon, color: PatientHomeScreen.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
