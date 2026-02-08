import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

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
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          /// LEFT DATE BOX
          Container(
            width: 52,
            height: 60,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  day,
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// DETAILS
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Info(title: "Punch In", value: inTime),
                _Info(title: "Punch Out", value: outTime),
                _Info(title: "Total Hours", value: total),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String title;
  final String value;

  const _Info({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: AppTextStyles.bodyBold),
        const SizedBox(height: 2),
        Text(title, style: AppTextStyles.caption),
      ],
    );
  }
}
