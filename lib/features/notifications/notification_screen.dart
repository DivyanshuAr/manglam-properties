import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(
            icon: Icons.calendar_today,
            iconBg: Color(0xFFFFF3E0),
            title: "Visit Due Today",
            message: "You have 2 inspections scheduled for today.",
            time: "Today",
            highlight: true,
          ),
          NotificationTile(
            icon: Icons.location_city,
            iconBg: Color(0xFFFFF3E0),
            title: "Reached Site Detection",
            message: "You appear to be near the inspection property. Start visit?",
            time: "Today",
            highlight: true,
          ),
          NotificationTile(
            icon: Icons.close,
            iconBg: Color(0xFFFFEAEA),
            title: "Lead Cancelled",
            message: "The assigned inspection for Case PV-2045 has been cancelled.",
            time: "Today",
            highlight: true,
          ),
          NotificationTile(
            icon: Icons.assignment,
            iconBg: Colors.white,
            title: "New Lead Assigned",
            message: "A new property inspection has been assigned to you.",
            time: "Yesterday",
          ),
          NotificationTile(
            icon: Icons.add_circle,
            iconBg: Colors.white,
            title: "Incomplete Form Reminder",
            message: "Inspection form for Case PV-2045 is incomplete.",
            time: "Yesterday",
          ),
        ],
      ),
    );
  }
}
