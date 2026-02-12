import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../attendance/attendance_screen.dart';
import '../expenses/expenses_screen.dart';
import '../profile/profile_screen.dart';
import '../leads/lead_management.dart';
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
    ExpensesScreen(),
    ProfileScreen(),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              index: 0,
              label: "Leads",
              inactiveIcon: "assets/icons/leaderboard.svg",
              activeIcon: "assets/icons/leaderboard_inactive.svg",
            ),
            _navItem(
              index: 1,
              label: "Attendance",
              inactiveIcon: "assets/icons/calendar_check.svg",
              activeIcon: "assets/icons/calendar_check_inactive.svg",
            ),
            _navItem(
              index: 2,
              label: "Home",
              inactiveIcon: "assets/icons/home.svg",
              activeIcon: "assets/icons/home_inactive.svg",
            ),
            _navItem(
              index: 3,
              label: "Expenses",
              inactiveIcon: "assets/icons/payments.svg",
              activeIcon: "assets/icons/payments_inactive.svg",
            ),
            _navItem(
              index: 4,
              label: "Profile",
              inactiveIcon: "assets/icons/account_circle.svg",
              activeIcon: "assets/icons/account_circle_inactive.svg",
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String label,
    required String activeIcon,
    required String inactiveIcon,
  }) {
    final selected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFFFF1D6) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              selected ? activeIcon : inactiveIcon,
              width: 22,
              height: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? AppColors.accent : Colors.grey,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
