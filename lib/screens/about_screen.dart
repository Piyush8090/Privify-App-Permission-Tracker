import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'About Privify',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.security, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About Privify',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Privify is your personal App Permission Tracker that helps you understand what data your apps access and how risky those permissions are.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 25),
            const Text(
              '🛡 Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text('• Track app permissions easily'),
            const Text('• Identify high-risk apps instantly'),
            const Text('• Get insights into app privacy behavior'),
            const SizedBox(height: 25),
            const Text(
              '💡 Our Mission:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'To make digital privacy simple and accessible for everyone.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: const [
                  Divider(),
                  Text(
                    'Developed by Team Privify',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
