import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_button.dart';

class ApplyLeaveSheet extends StatelessWidget {
  const ApplyLeaveSheet({super.key});

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
            const Text("Apply Leave", style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              "Please provide the required details to request leave.",
              style: AppTextStyles.subText,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(child: _dateField("From Date")),
                const SizedBox(width: 12),
                Expanded(child: _dateField("To Date")),
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
            const Text("No. of Days: 0"),

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
            )
          ],
        ),
      ),
    );
  }

  Widget _dateField(String hint) {
    return TextField(
      readOnly: true,
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
