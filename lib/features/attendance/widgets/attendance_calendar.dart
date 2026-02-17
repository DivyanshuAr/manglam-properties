import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AttendanceCalendar extends StatelessWidget {
  final int month;
  final int year;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const AttendanceCalendar({
    super.key,
    required this.month,
    required this.year,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final startWeekday = firstDay.weekday % 7;
    final totalCells = startWeekday + daysInMonth;
    final rows = (totalCells / 7).ceil();
    final today = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              _Day("Su"),
              _Day("Mo"),
              _Day("Tu"),
              _Day("We"),
              _Day("Th"),
              _Day("Fr"),
              _Day("Sa"),
            ],
          ),
          for (int r = 0; r < rows; r++)
            Row(
              children: List.generate(7, (c) {
                final index = r * 7 + c;
                final dayNum = index - startWeekday + 1;

                if (index < startWeekday || dayNum > daysInMonth) {
                  return const _EmptyCell();
                }

                final date = DateTime(year, month, dayNum);

                final isSelected =
                    date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;

                final isToday =
                    date.day == today.day &&
                        date.month == today.month &&
                        date.year == today.year;

                return Expanded(
                  child: InkWell(
                    onTap: () => onDateSelected(date),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isToday
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected
                            ? AppColors.accent.withOpacity(0.15)
                            : Colors.transparent,
                      ),
                      child: Text(
                        dayNum.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected || isToday
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}

class _Day extends StatelessWidget {
  final String text;
  const _Day(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyCell extends StatelessWidget {
  const _EmptyCell();

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: SizedBox(height: 48));
  }
}
