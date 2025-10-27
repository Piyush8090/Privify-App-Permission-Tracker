import 'dart:typed_data';
import 'package:device_apps/device_apps.dart';
import '../models/permission_model.dart';

class AppPermissionService {
  static Future<List<AppPermissionModel>> getInstalledApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: false,
    );

    List<AppPermissionModel> appList = [];

    for (var app in apps) {
      // Dummy set of permissions (for demo purpose)
      final permissions = _mockPermissions(app);

      String riskLevel = _calculateRiskLevelFromTypes(permissions);

      appList.add(
        AppPermissionModel(
          name: app.appName,
          iconPath: '',
          permissionCount: permissions.length,
          riskLevel: riskLevel,
          iconBytes: app is ApplicationWithIcon ? app.icon : null,
        ),
      );
    }

    return appList;
  }

  /// Mock permissions per app — random based on app name
  static List<String> _mockPermissions(Application app) {
    final allPermissions = [
      'Camera',
      'Microphone',
      'Location',
      'Storage',
      'Contacts',
      'Network',
      'Notifications',
      'SMS',
      'Calendar',
    ];

    int count = (app.appName.length % allPermissions.length) + 1;
    return allPermissions.sublist(0, count);
  }

  /// Smarter risk logic: weighs permissions by sensitivity
  static String _calculateRiskLevelFromTypes(List<String> permissions) {
    int riskScore = 0;
    for (var p in permissions) {
      if (['Camera', 'Microphone'].contains(p)) {
        riskScore += 3;
      } else if (['Location', 'Contacts', 'Storage', 'SMS'].contains(p)) {
        riskScore += 2;
      } else {
        riskScore += 1;
      }
    }

    if (riskScore >= 15) return 'High';
    if (riskScore >= 8) return 'Medium';
    return 'Low';
  }
}
