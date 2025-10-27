import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PrivifyApp());
}

class PrivifyApp extends StatelessWidget {
  const PrivifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privify – App Permission Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFF8F8FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6A1B9A), // safe purple
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
