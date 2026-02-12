import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  String gender = "Male";
  String relation = "Father";

  final nameController = TextEditingController(text: "Jatin Singh");
  final dobController = TextEditingController(text: "05/05/1988");
  final mobileController = TextEditingController(text: "9876543210");
  final emailController =
  TextEditingController(text: "jatinsingh@gmail.com");
  final currentAddressController = TextEditingController(
      text:
      "19-AD, Pratap nagar, near police station,\nJodhpur, Rajasthan-342001");
  final permanentAddressController = TextEditingController(
      text:
      "19-AD, Pratap nagar, near police station,\nJodhpur, Rajasthan-342001");
  final emergencyNameController =
  TextEditingController(text: "Lalit Singh");
  final emergencyNumberController =
  TextEditingController(text: "8794632150");

  InputDecoration inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF8F6F2),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
    );
  }

  TextStyle labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B6B6B),
  );

  TextStyle valueStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF5A5A5A),
  );

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
          "Personal Details",
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Full Name (as per Aadhaar)", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Date of Birth", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: dobController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Gender", style: labelStyle),
              const SizedBox(height: 8),
              Row(
                children: [
                  _radio("Male"),
                  const SizedBox(width: 16),
                  _radio("Female"),
                  const SizedBox(width: 16),
                  _radio("Other"),
                ],
              ),
              const SizedBox(height: 16),
              Text("Mobile Number", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: mobileController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Email ID", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Current Address", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: currentAddressController,
                maxLines: 2,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Permanent Address", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: permanentAddressController,
                maxLines: 2,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Emergency Contact Name", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: emergencyNameController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 16),
              Text("Emergency Contact Relationship", style: labelStyle),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F6F2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E5E5)),
                ),
                child: DropdownButton<String>(
                  value: relation,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: valueStyle,
                  items: ["Father", "Mother", "Brother", "Sister"]
                      .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) => setState(() => relation = v!),
                ),
              ),
              const SizedBox(height: 16),
              Text("Emergency Contact Number", style: labelStyle),
              const SizedBox(height: 8),
              TextField(
                controller: emergencyNumberController,
                style: valueStyle,
                decoration: inputDecoration(),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save Changes",
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

  Widget _radio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: gender,
          activeColor: AppColors.accent,
          onChanged: (v) => setState(() => gender = v!),
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}
