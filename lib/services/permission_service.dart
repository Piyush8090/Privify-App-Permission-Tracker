import '../models/permission_model.dart';

class AppService {
  static List<AppPermissionModel> getMockApps() {
    return [
      AppPermissionModel(
        name: 'Instagram',
        iconPath: 'assets/icons/instagram.png',
        permissionCount: 5,
        riskLevel: 'High',
      ),
      AppPermissionModel(
        name: 'WhatsApp',
        iconPath: 'assets/icons/whatsapp.png',
        permissionCount: 4,
        riskLevel: 'Medium',
      ),
      AppPermissionModel(
        name: 'Signal',
        iconPath: 'assets/icons/signal.png',
        permissionCount: 4,
        riskLevel: 'Low',
      ),
    ];
  }
}
