import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../profile/profile_screen.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({super.key});

  @override
  State<ResetPinScreen> createState() => _ResetPinScreenState();
}

class _ResetPinScreenState extends State<ResetPinScreen> {
  final oldPin = List.generate(4, (_) => TextEditingController());
  final newPin = List.generate(4, (_) => TextEditingController());
  final confirmPin = List.generate(4, (_) => TextEditingController());

  bool get isValid =>
      oldPin.every((c) => c.text.isNotEmpty) &&
          newPin.every((c) => c.text.isNotEmpty) &&
          confirmPin.every((c) => c.text.isNotEmpty);

  TextStyle labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B6B6B),
  );

  Widget buildPinRow(List<TextEditingController> controllers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (i) {
        return SizedBox(
          width: 60,
          height: 55,
          child: TextField(
            controller: controllers[i],
            obscureText: true,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (v) {
              if (v.isNotEmpty && i < 3) {
                FocusScope.of(context).nextFocus();
              }
              setState(() {});
            },
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: const Color(0xFFF8F6F2),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Reset Pin",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reset Login Pin",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Create a 4-digit MPIN to securely access your account.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              const SizedBox(height: 20),
              Text("Enter Old Pin", style: labelStyle),
              const SizedBox(height: 10),
              buildPinRow(oldPin),
              const SizedBox(height: 20),
              Text("Enter New Pin", style: labelStyle),
              const SizedBox(height: 10),
              buildPinRow(newPin),
              const SizedBox(height: 20),
              Text("Confirm New Pin", style: labelStyle),
              const SizedBox(height: 10),
              buildPinRow(confirmPin),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isValid
                      ? () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProfileScreen()),
                          (route) => false,
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isValid ? AppColors.accent : Colors.grey.shade300,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
