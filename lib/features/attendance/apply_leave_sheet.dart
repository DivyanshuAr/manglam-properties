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
  final reasonController = TextEditingController();

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  String formatDate(DateTime d) {
    return "${d.day}/${d.month}/${d.year}";
  }

  int get totalDays => toDate.difference(fromDate).inDays + 1;

  @override
  void initState() {
    super.initState();
    fromDateController.text = formatDate(fromDate);
    toDateController.text = formatDate(toDate);
  }

  Future<void> pickDate(BuildContext context, bool isFrom) async {
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
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Apply Leave", style: AppTextStyles.heading),
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
                            () => pickDate(context, true)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _dateField(
                        "To Date",
                        toDateController,
                            () => pickDate(context, false)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter reason...",
                  hintStyle: AppTextStyles.subText,
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text("No. of Days: $totalDays",
                  style: AppTextStyles.bodyBold),
              const SizedBox(height: 16),
              AppButton(
                title: "Submit",
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField(
      String hint, TextEditingController controller, VoidCallback onTap) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.subText,
        suffixIcon: const Icon(Icons.calendar_today_outlined),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
