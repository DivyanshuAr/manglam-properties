import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../leads/lead_management.dart';
import '../attendance/attendance_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2;

  final List<Widget> _screens = const [
    LeadManagementScreen(),
    AttendanceScreen(), // ✅ FIXED
    SizedBox(), // Home blank
    Center(child: Text("Expenses Screen")),
    Center(child: Text("Profile Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.grey,
        items: [
          _navItem(Icons.bar_chart_outlined, "Leads", 0),
          _navItem(Icons.calendar_today_outlined, "Attendance", 1),
          _navItem(Icons.home, "Home", 2, isHome: true),
          _navItem(Icons.account_balance_wallet_outlined, "Expenses", 3),
          _navItem(Icons.person_outline, "Profile", 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navItem(
      IconData icon,
      String label,
      int index, {
        bool isHome = false,
      }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: isHome ? const EdgeInsets.all(8) : EdgeInsets.zero,
        decoration: isHome && _selectedIndex == index
            ? BoxDecoration(
          color: AppColors.accent.withOpacity(0.2),
          shape: BoxShape.circle,
        )
            : null,
        child: Icon(icon),
      ),
    );
  }
}
