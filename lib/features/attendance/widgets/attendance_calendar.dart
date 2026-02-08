import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AttendanceCalendar extends StatelessWidget {
  final int month;
  final int year;

  const AttendanceCalendar({
    super.key,
    required this.month,
    required this.year,
  });

  ///  FIGMA STYLE (Sunday first)
  static const List<String> weekDays = [
    "SU",
    "MO",
    "TU",
    "WE",
    "TH",
    "FR",
    "SA",
  ];

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(year, month, 1);
    final totalDays = DateTime(year, month + 1, 0).day;

    /// MAIN FIX (Sunday first)
    final int startWeekday = firstDayOfMonth.weekday % 7;

    return Column(
      children: [
        /// WEEK HEADER
        Row(
          children: weekDays
              .map(
                (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyles.label,
                ),
              ),
            ),
          )
              .toList(),
        ),

        const SizedBox(height: 10),

        /// CALENDAR GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: startWeekday + totalDays,
          itemBuilder: (context, index) {
            if (index < startWeekday) {
              return const SizedBox();
            }

            final dayNumber = index - startWeekday + 1;
            final date = DateTime(year, month, dayNumber);
            final isToday = _isToday(date);

            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isToday
                    ? AppColors.primary.withOpacity(0.15)
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isToday
                      ? AppColors.primary
                      : AppColors.border,
                ),
              ),
              child: Text(
                dayNumber.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isToday
                      ? AppColors.primary
                      : AppColors.textPrimary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }
}
