# HealthSync – Frontend (Flutter) 

**HealthSync** is a mobile healthcare platform designed to simplify the interaction between **doctors and patients**.  
This repository contains the **Flutter frontend implementation** of HealthSync, focusing on **Doctor & Patient registration/login flows**, profile management, and a **consistent modern UI theme**.  

---

## Implemented Features

### Doctor Module
- **Doctor Registration (Multi-step process):**
  - Step 1: Basic details (name, email, password, etc.)
  - Step 2: Professional details (specialization, qualifications)
  - Step 3: Clinic/Hospital details
  - Step 4: Experience & Certifications
  - Step 5: Verification and final confirmation  
- **Doctor Login** with form validation and password visibility toggle.
- **Doctor Profile Setup** (after registration).

### Patient Module
- **Patient Registration** (Simple & elegant form):
  - Name, Email, Password, Confirm Password (with validation)
  - Password visibility toggle
- **Patient Login** with "Forgot Password" option.
- **Patient Profile Setup** (basic information management).

### Navigation Flow
- **Splash Screen** → **Welcome Screen** → **Role Selection** (Doctor/Patient) → **Registration / Login**  
- Consistent navigation across all screens using Flutter routes.

### UI/UX Design
- **Theme:** Light **purple & white** for a professional healthcare feel.
- **AppBar:** Deep purple navigation bar with a **stethoscope icon** (logo).
- **Form Fields:** Styled with purple borders, icons, and labels.
- **Cards & Buttons:** Rounded, soft shadows for modern look.
- **Consistency:** All screens follow the same design system.

---

## Tech Stack

- **Frontend Framework:** Flutter (Dart)  
- **IDE:** Visual Studio Code  
- **State Management:** Flutter’s built-in `setState` (for now)  
- **Navigation:** Flutter `Navigator` with named routes  
- **Design Theme:** `Colors.deepPurple` + White  

---

## Project Structure (Frontend Only)

```bash
healthsync/
│
├── lib/
│   ├── screens/              # All app screens
│   │   ├── splash/           # Splash & Welcome screens
│   │   ├── auth/             # Login & Registration (Doctor/Patient)
│   │   ├── doctor/           # Multi-step doctor registration
│   │   ├── patient/          # Patient registration & login
│   │   └── common/           # Shared components
│   │
│   ├── widgets/              # Reusable widgets (buttons, text fields, etc.)
│   ├── routes/               # AppRoutes for navigation
│   └── main.dart             # Entry point
│
├── assets/                   # App icons, images
├── pubspec.yaml              # Flutter dependencies
└── README.md                 # Documentation
```
---

## Prerequisites

Make sure you have installed:
- Flutter (3.0+ recommended)
- VS Code with Flutter & Dart extensions

## Clone the Repository
```bash
git clone https://github.com/FaizaMaqsood/healthsync.git
cd healthsync
```

## Install Dependencies
```bash
flutter pub get
```

## Run the App
```bash
flutter run
```
## Author

**[Faiza Maqsood](https://github.com/FaizaMaqsood)**
## License

This project is licensed under the MIT License – free to use and modify.
