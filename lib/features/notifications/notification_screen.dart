import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "icon": Icons.calendar_month_outlined,
        "iconBg": const Color(0xFFFFF8E1),
        "iconColor": const Color(0xFFFFA000),
        "title": "Visit Due Today",
        "message": "You have 2 inspections scheduled for today.",
        "time": "Today",
        "highlight": true,
      },
      {
        "icon": Icons.domain_outlined,
        "iconBg": const Color(0xFFFFF8E1),
        "iconColor": const Color(0xFFFFA000),
        "title": "Reached Site Detection",
        "message": "You appear to be near the inspection property. Start visit?",
        "time": "Today",
        "highlight": true,
      },
      {
        "icon": Icons.cancel_outlined,
        "iconBg": const Color(0xFFFFEBEE),
        "iconColor": const Color(0xFFD32F2F),
        "title": "Lead Cancelled",
        "message": "The assigned inspection for Case PV-2045 has been cancelled.",
        "time": "Today",
        "highlight": true,
      },
      {
        "icon": Icons.assignment_ind_outlined,
        "iconBg": const Color(0xFFF5F5F5),
        "iconColor": const Color(0xFF424242),
        "title": "New Lead Assigned",
        "message": "A new property inspection has been assigned to you.",
        "time": "Yesterday",
        "highlight": false,
      },
      {
        "icon": Icons.alarm_on_outlined,
        "iconBg": const Color(0xFFF5F5F5),
        "iconColor": const Color(0xFF424242),
        "title": "Incomplete Form Reminder",
        "message": "Inspection form for Case PV-2045 is incomplete.",
        "time": "Yesterday",
        "highlight": false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return NotificationTile(
            icon: item['icon'],
            iconBg: item['iconBg'],
            iconColor: item['iconColor'],
            title: item['title'],
            message: item['message'],
            time: item['time'],
            highlight: item['highlight'],
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool highlight;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: highlight
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF757575),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}