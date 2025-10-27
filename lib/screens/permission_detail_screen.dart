import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../models/permission_model.dart';

class PermissionDetailScreen extends StatelessWidget {
  final AppPermissionModel app;

  const PermissionDetailScreen({super.key, required this.app});

  Color _getRiskColor(String level) {
    switch (level.toLowerCase()) {
      case 'high':
        return Colors.redAccent;
      case 'medium':
        return Colors.orangeAccent;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final permissions = [
      {'name': 'Camera', 'level': 'High'},
      {'name': 'Location', 'level': 'Medium'},
      {'name': 'Storage', 'level': 'High'},
      {'name': 'Microphone', 'level': 'Low'},
      {'name': 'Contacts', 'level': 'Medium'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(app.name),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(app),
            const SizedBox(height: 20),
            const Text(
              'Permissions Used',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: permissions.length,
                itemBuilder: (context, index) {
                  final p = permissions[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey.shade100],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: const Icon(Icons.lock_outline, color: Colors.indigo),
                      ),
                      title: Text(
                        p['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: p['level'] == 'High'
                              ? Colors.red
                              : p['level'] == 'Medium'
                                  ? Colors.orange
                                  : Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppPermissionModel app) {
    return Row(
      children: [
        _buildAppIcon(app.iconBytes, app.iconPath),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              app.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getRiskColor(app.riskLevel),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${app.permissionCount} Permissions • ${app.riskLevel} Risk',
                  style: TextStyle(
                    color: _getRiskColor(app.riskLevel),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppIcon(Uint8List? bytes, String path) {
    if (bytes != null && bytes.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.memory(bytes, width: 60, height: 60, fit: BoxFit.cover),
      );
    }

    if (path.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(path, width: 60, height: 60, fit: BoxFit.cover),
      );
    }

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(Icons.android, color: Colors.white, size: 36),
    );
  }
}
