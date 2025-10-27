import 'package:flutter/material.dart';
import '../models/permission_model.dart';
import '../screens/permission_detail_screen.dart';

class PermissionCard extends StatelessWidget {
  final AppPermissionModel app;

  const PermissionCard({super.key, required this.app});

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
    final riskColor = _getRiskColor(app.riskLevel);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PermissionDetailScreen(app: app),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            children: [
              // App icon
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: app.iconBytes != null
                    ? Image.memory(app.iconBytes!, width: 45, height: 45, fit: BoxFit.cover)
                    : Image.asset(app.iconPath, width: 45, height: 45, fit: BoxFit.cover),
              ),
              const SizedBox(width: 14),

              // App info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${app.permissionCount} permissions • ${app.riskLevel} risk',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),

              // Risk dot
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: riskColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
