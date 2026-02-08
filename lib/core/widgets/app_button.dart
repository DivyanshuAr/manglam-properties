import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isEnabled = true, // ✅ default enabled
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null, // ✅ disable logic
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isEnabled ? AppColors.accent : Colors.grey.shade300,
          foregroundColor:
          isEnabled ? Colors.white : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
