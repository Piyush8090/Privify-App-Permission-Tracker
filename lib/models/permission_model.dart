class AppPermissionModel {
  final String name;
  final String iconPath;
  final int permissionCount;
  final String riskLevel;

  AppPermissionModel({
    required this.name,
    required this.iconPath,
    required this.permissionCount,
    required this.riskLevel,
  });
}
