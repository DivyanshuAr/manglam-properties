import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'widgets/attendance_calendar.dart';
import 'widgets/attendance_day_card.dart';
import 'apply_leave_sheet.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late int selectedMonth;
  late int selectedYear;

  final List<String> months = const [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedMonth = now.month - 1;
    selectedYear = now.year;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: const Text("Attendance", style: AppTextStyles.appBarTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary.withOpacity(0.1),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => const ApplyLeaveSheet(),
                );
              },
              child: const Text(
                "Apply Leave",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// MONTH TABS
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: months.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedMonth;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedMonth = index);
                    },
                    child: Column(
                      children: [
                        Text(
                          months[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 22,
                            color: AppColors.primary,
                          )
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// MONTH + YEAR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(months[selectedMonth],
                    style: AppTextStyles.heading),
                DropdownButton<int>(
                  value: selectedYear,
                  underline: const SizedBox(),
                  items: List.generate(6, (index) {
                    final year = DateTime.now().year - 3 + index;
                    return DropdownMenuItem(
                      value: year,
                      child: Text(year.toString()),
                    );
                  }),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedYear = value);
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// CALENDAR
            AttendanceCalendar(
              month: selectedMonth + 1,
              year: selectedYear,
            ),

            const SizedBox(height: 16),

            /// LEGEND
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _Legend(color: Colors.blue, label: "Half Day"),
                _Legend(color: Colors.red, label: "Absent"),
                _Legend(color: Colors.purple, label: "Holiday"),
              ],
            ),

            const SizedBox(height: 16),

            /// ATTENDANCE LIST
            AttendanceDayCard(
              date: "01",
              day: "MON",
              inTime: "09:50 AM",
              outTime: "06:05 PM",
              total: "08:13",
              bgColor: Colors.greenAccent.shade100,
            ),
            AttendanceDayCard(
              date: "02",
              day: "TUE",
              inTime: "09:30 AM",
              outTime: "06:30 PM",
              total: "09:00",
              bgColor: Colors.greenAccent.shade100,
            ),
            AttendanceDayCard(
              date: "03",
              day: "WED",
              inTime: "09:08 AM",
              outTime: "06:05 PM",
              total: "08:30",
              bgColor: Colors.redAccent.shade100,
            ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;

  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.label),
      ],
    );
  }
}
