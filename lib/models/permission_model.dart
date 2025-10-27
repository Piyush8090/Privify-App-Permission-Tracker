import 'dart:typed_data';
class AppPermissionModel {
  final String name;
  final String iconPath;
  final int permissionCount;
  final String riskLevel;
  final Uint8List? iconBytes;


  AppPermissionModel({
    required this.name,
    required this.iconPath,
    required this.permissionCount,
    required this.riskLevel,
    this.iconBytes,
  });
}
