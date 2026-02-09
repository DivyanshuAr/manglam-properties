import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';

class ApplyLeaveSheet extends StatefulWidget {
  const ApplyLeaveSheet({super.key});

  @override
  State<ApplyLeaveSheet> createState() => _ApplyLeaveSheetState();
}

class _ApplyLeaveSheetState extends State<ApplyLeaveSheet> {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  String formatDate(DateTime d) {
    return "${d.day}/${d.month}/${d.year}";
  }

  int get totalDays {
    return toDate.difference(fromDate).inDays + 1;
  }

  @override
  void initState() {
    super.initState();
    fromDateController.text = formatDate(fromDate);
    toDateController.text = formatDate(toDate);
  }

  Future<void> pickDate(
      BuildContext context, bool isFrom) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isFrom ? fromDate : toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          fromDateController.text = formatDate(picked);
        } else {
          toDate = picked;
          toDateController.text = formatDate(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Apply Leave",
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            const Text(
              "Please provide the required details to request leave.",
              style: AppTextStyles.subText,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _dateField(
                    "From Date",
                    fromDateController,
                        () => pickDate(context, true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _dateField(
                    "To Date",
                    toDateController,
                        () => pickDate(context, false),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Enter reason...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "No. of Days: $totalDays",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    title: "Submit",
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateField(
      String hint,
      TextEditingController controller,
      VoidCallback onTap,
      ) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: const Icon(Icons.calendar_today_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
