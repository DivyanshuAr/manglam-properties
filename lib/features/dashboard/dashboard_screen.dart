import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../leads/lead_management.dart';
import '../attendance/attendance_screen.dart';
import 'dashboard_home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2;

  final List<Widget> _screens = const [
    LeadManagementScreen(),
    AttendanceScreen(),
    DashboardHomeScreen(),
    Center(child: Text("Expenses Screen")),
    Center(child: Text("Profile Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: Colors.grey,
          items: [
            _navItem("assets/icons/leaderboard.svg", "Leads", 0),
            _navItem("assets/icons/calendar_check.svg", "Attendance", 1),
            _navItem("assets/icons/home.svg", "Home", 2),
            _navItem("assets/icons/payments.svg", "Expenses", 3),
            _navItem("assets/icons/account_circle.svg", "Profile", 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    final selected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color:
              selected ? AppColors.accent.withOpacity(0.15) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              icon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                selected ? AppColors.accent : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
