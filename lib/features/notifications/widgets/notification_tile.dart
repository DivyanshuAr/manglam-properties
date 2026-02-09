import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String message;
  final String time;
  final bool highlight;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.message,
    required this.time,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlight ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        boxShadow: highlight
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          )
        ]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20),
          ),

          const SizedBox(width: 12),

          /// text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(title,
                          style: AppTextStyles.cardTitle),
                    ),
                    Text(time, style: AppTextStyles.label),
                  ],
                ),
                const SizedBox(height: 4),
                Text(message, style: AppTextStyles.subText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
