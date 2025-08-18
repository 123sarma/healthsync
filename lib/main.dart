import 'package:flutter/material.dart';
import 'package:health_sync/routes/app_routes.dart';
import 'package:health_sync/screens/splash_screen.dart';
import 'package:health_sync/screens/home_screen.dart';
import 'package:health_sync/screens/role_selection_screen.dart';
import 'package:health_sync/screens/doctor_complete_registration.dart';
import 'package:health_sync/screens/doctor_verification.dart';
import 'package:health_sync/screens/doctor_register_screen.dart';
import 'package:health_sync/screens/doctor_login_screen.dart';
import 'package:health_sync/screens/doctor_register_step1.dart';
import 'package:health_sync/screens/doctor_register_step2.dart';
import 'package:health_sync/screens/doctor_register_step3.dart';
import 'package:health_sync/screens/doctor_register_step4.dart';
import 'package:health_sync/screens/doctor_register_step5.dart';
import 'package:health_sync/screens/doctor_register_step6.dart';
import 'package:health_sync/screens/doctor_register_step7.dart';
import 'package:health_sync/screens/doctor_forgot_password_screen.dart';
import 'package:health_sync/screens/patient_registration_screen.dart';
import 'package:health_sync/screens/patient_login_screen.dart';
import 'package:health_sync/screens/PatientForgotPasswordScreen.dart';
import 'package:health_sync/screens/DoctorUploadDocumentsScreen.dart';
import 'package:health_sync/screens/doctor_dashboard_screen.dart';
import 'package:health_sync/screens/patient_dashboard_screen.dart';
import 'package:health_sync/screens/my_profile_screen.dart';
import 'package:health_sync/screens/edit_profile_screen.dart';
import 'package:health_sync/screens/edit_more_details_screen.dart';
import 'package:health_sync/screens/attendance_screen.dart';
import 'package:health_sync/screens/add_bank_details_screen.dart';
import 'package:health_sync/screens/withdraw_screen.dart';
import 'package:health_sync/screens/doctor_my_appointments_screen.dart';
import 'package:health_sync/screens/booking_information_screen.dart';
import 'package:health_sync/screens/DoctorCancelAppointmentScreen.dart';
import 'package:health_sync/screens/patient_profile_screen.dart';
import 'package:health_sync/screens/change_password_screen.dart';
import 'package:health_sync/screens/view_appointments_screen.dart';
import 'package:health_sync/screens/RescheduleAppointmentScreen.dart';
import 'package:health_sync/screens/patient_home_screen.dart';
import 'package:health_sync/screens/doctor_profile_screen.dart';

void main() {
  runApp(const HealthSyncApp());
}

class HealthSyncApp extends StatelessWidget {
  const HealthSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthSync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18.0),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.roleSelectionScreen: (context) => const RoleSelectionScreen(),
        AppRoutes.doctorLogin: (context) => const DoctorLoginScreen(),
        AppRoutes.doctorRegister: (context) => const DoctorRegisterScreen(),
        AppRoutes.doctorRegisterStep1: (context) => const DoctorRegisterStep1(),
        AppRoutes.doctorRegisterStep2: (context) => const DoctorRegisterStep2(),
        AppRoutes.doctorRegisterStep3: (context) => const DoctorRegisterStep3(),
        AppRoutes.doctorRegisterStep4: (context) => const DoctorRegisterStep4(),
        AppRoutes.doctorRegisterStep5: (context) => const DoctorRegisterStep5(),
        AppRoutes.doctorRegisterStep6: (context) => const DoctorRegisterStep6(),
        AppRoutes.doctorRegisterStep7: (context) => const DoctorRegisterStep7(), 
        AppRoutes.doctorCompleteRegistration: (context) => const DoctorCompleteRegistration(),
        AppRoutes.doctorVerification: (context) => const DoctorVerification(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.patientRegistrationScreen: (context) => const PatientRegistrationScreen(),
        AppRoutes.patientLogin: (context) => const PatientLoginScreen(),
        AppRoutes.doctorForgotPasswordScreen: (context) => const DoctorForgotPasswordScreen(), 
        AppRoutes.patientForgotPasswordScreen: (context) => const PatientForgotPasswordScreen(), 
        AppRoutes.doctorUploadDocumentsScreen: (context) => const DoctorUploadDocumentsScreen(),
        AppRoutes.doctorDashboardScreen: (context) => const DoctorDashboardScreen(),
        AppRoutes.patientDashboardScreen: (context) => const PatientDashboardScreen(),
        //AppRoutes.myProfileScreen: (context) => const MyProfileScreen(),
        AppRoutes.editProfileScreen: (context) => const EditProfileScreen(),
        AppRoutes.editMoreDetailsScreen: (context) => const EditMoreDetailsScreen(),
        AppRoutes.attendanceScreen: (context) => const AttendanceScreen(),
        AppRoutes.addBankDetailsScreen: (context) => const AddBankDetailsScreen(),
        AppRoutes.withdrawScreen: (context) => const WithdrawScreen(),
        AppRoutes.doctorMyAppointmentsScreen: (context) => const DoctorMyAppointmentsScreen(),
        AppRoutes.bookingInformationScreen: (context) => const BookingInformationScreen(),
        AppRoutes.doctorCancelAppointmentScreen: (context) => const DoctorCancelAppointmentScreen(),
        AppRoutes.patientProfileScreen: (context) => const PatientProfileScreen(),
        AppRoutes.changePasswordScreen: (context) => const ChangePasswordScreen(),
        AppRoutes.viewAppointmentsScreen: (context) => const ViewAppointmentsScreen(),
      //  AppRoutes.rescheduleAppointmentScreen: (context) => const RescheduleAppointmentScreen(),
        AppRoutes.patientHomeScreen: (context) => const PatientHomeScreen(),
      //  AppRoutes.doctorProfileScreen: (context) => const DoctorProfileScreen(),


      },
    );
  }
}
