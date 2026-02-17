import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AttendanceDayCard extends StatelessWidget {
  final String date;
  final String day;
  final String inTime;
  final String outTime;
  final String total;
  final Color bgColor;

  const AttendanceDayCard({
    super.key,
    required this.date,
    required this.day,
    required this.inTime,
    required this.outTime,
    required this.total,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(day, style: const TextStyle(fontSize: 12))
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                _time("Punch In", inTime),
                _time("Punch Out", outTime),
                _time("Total Hours", total),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _time(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style:
            const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
