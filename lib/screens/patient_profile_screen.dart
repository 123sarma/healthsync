import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  static const Color deepPurple = Color(0xFF8A56AC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: deepPurple,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/patient.webp'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Faiza Maqsood',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: deepPurple),
            ),
            const SizedBox(height: 8),
            const Text('faizamaqsood@gmail.com', style: TextStyle(fontSize: 16)),
            const Divider(height: 32),

            _buildOptionTile(Icons.edit, 'Edit Profile', () {
              Navigator.pushNamed(context, AppRoutes.editProfileScreen);
            }),
            _buildOptionTile(Icons.lock, 'Change Password', () {
              Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
            }),

            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            _buildOptionTile(Icons.description, 'Terms of Use', () {}),
            _buildOptionTile(Icons.privacy_tip, 'Privacy Policy', () {}),
            _buildOptionTile(Icons.help_outline, 'Help & FAQ', () {}),
            _buildOptionTile(Icons.logout, 'Logout', () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.roleSelectionScreen,
                (route) => false,
              );
            }),
            _buildOptionTile(Icons.delete, 'Delete Account', () {
              _confirmDeleteAccount(context);
            }),

            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            _buildOptionTile(Icons.account_balance_wallet, 'My Wallet', () {}),
            _buildOptionTile(Icons.favorite_border, 'Saved Doctor', () {}),
            _buildOptionTile(Icons.calendar_today, 'My Appointments', () {}),
            _buildOptionTile(Icons.group_add, 'Add Patients', () {}),

            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),

            _buildOptionTile(Icons.notifications, 'Push Notification', () {}),
            _buildOptionTile(Icons.language, 'Language', () {}),
            _buildOptionTile(Icons.star, 'Rate Us', () {}),
            _buildOptionTile(Icons.share, 'Share App', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text('Are you sure you want to permanently delete your account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _showReauthDialog(context);
            },
            child: const Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showReauthDialog(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Enter Your Credentials'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _showCodeDialog(context, emailController.text);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showCodeDialog(BuildContext context, String email) {
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Enter Verification Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('A verification code has been sent to $email'),
            const SizedBox(height: 10),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: 'Verification Code'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _showSuccessDialog(context);
            },
            child: const Text('Verify'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Account Deleted'),
        content: const Text('Your account has been successfully deleted.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.roleSelectionScreen,
                (route) => false,
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
