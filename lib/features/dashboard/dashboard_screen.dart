import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../attendance/attendance_screen.dart';
import '../expenses/expenses_screen.dart';
import '../expenses/expenses_screen_v2.dart';
import '../profile/profile_screen.dart';
import '../leads/lead_management.dart';
import 'dashboard_home.dart';
import 'dashboard_home_v2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2; // Default to DashboardHomeScreen

  // Screens list matched with indices 0 to 6
  final List<Widget> _screens = [
    const LeadManagementScreen(), // 0
    const AttendanceScreen(),     // 1
    const DashboardHomeScreen(),  // 2
    const DashboardHomeV2(),      // 3
    const ExpensesScreen(),       // 4
    const ExpensesScreenV2(),     // 5
    const ProfileScreen(),        // 6
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, "Leads", "assets/icons/leaderboard.svg", "assets/icons/leaderboard_inactive.svg"),
              _navItem(1, "Attendance", "assets/icons/calendar_check.svg", "assets/icons/calendar_check_inactive.svg"),
              _navItem(2, "Home", "assets/icons/home.svg", "assets/icons/home_inactive.svg"),
              _navItem(3, "Home 2", "assets/icons/home.svg", "assets/icons/home_inactive.svg"),
              _navItem(4, "Expenses", "assets/icons/payments.svg", "assets/icons/payments_inactive.svg"),
              _navItem(5, "Exp 2", "assets/icons/payments.svg", "assets/icons/payments_inactive.svg"),
              _navItem(6, "Profile", "assets/icons/account_circle.svg", "assets/icons/account_circle_inactive.svg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, String label, String inactiveIcon, String activeIcon) {
    final selected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFFF1EB) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                selected ? activeIcon : inactiveIcon,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  selected ? const Color(0xFFFF6411) : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: selected ? const Color(0xFFFF6411) : Colors.grey,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}