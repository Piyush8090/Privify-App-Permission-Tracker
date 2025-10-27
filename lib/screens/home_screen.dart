import 'package:flutter/material.dart';
import 'package:privify/widget/permission_card.dart';
import '../services/permission_service.dart';
import '../models/permission_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AppPermissionModel> apps = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  Future<void> _loadApps() async {
    final result = await AppPermissionService.getInstalledApps();
    setState(() {
      apps = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'App Permission Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 4,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            )
          : RefreshIndicator(
              onRefresh: _loadApps,
              color: Colors.indigo,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: PermissionCard(app: apps[index]),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadApps,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
