import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import 'register_step2_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentAddressController = TextEditingController();
  final TextEditingController permanentAddressController = TextEditingController();
  final TextEditingController emergencyNameController = TextEditingController();
  final TextEditingController emergencyNumberController = TextEditingController();

  String gender = "Male";
  String relation = "";
  bool sameAddress = false;

  TextStyle labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B6B6B),
  );

  InputDecoration inputDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF9A9A9A),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      suffixIcon: suffix,
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

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day.toString().padLeft(2, '0')}/"
            "${picked.month.toString().padLeft(2, '0')}/"
            "${picked.year}";
      });
    }
  }

  void handleSameAddress(bool value) {
    setState(() {
      sameAddress = value;
      if (value) {
        permanentAddressController.text = currentAddressController.text;
      } else {
        permanentAddressController.clear();
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    emailController.dispose();
    currentAddressController.dispose();
    permanentAddressController.dispose();
    emergencyNameController.dispose();
    emergencyNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Signup",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Please enter following details to Register",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFD6B36A),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Step Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5C5C5C),
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "1",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFC9A44D),
                                  ),
                                ),
                                TextSpan(
                                  text: "/5",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFC9A44D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Personal Details",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),

                            Text("Full Name (as per Aadhaar)", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: nameController,
                              decoration: inputDecoration("Enter Full Name"),
                            ),

                            const SizedBox(height: 16),

                            Text("Date of Birth", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: dobController,
                              readOnly: true,
                              onTap: pickDate,
                              decoration: inputDecoration(
                                "Select DOB",
                                suffix: const Icon(Icons.calendar_today_outlined, size: 18),
                              ),
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
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: inputDecoration("Enter Mobile Number"),
                            ),

                            const SizedBox(height: 16),

                            Text("Email ID", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: inputDecoration("Enter Email ID"),
                            ),

                            const SizedBox(height: 16),

                            Text("Current Address", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: currentAddressController,
                              maxLines: 2,
                              onChanged: (_) {
                                if (sameAddress) {
                                  permanentAddressController.text = currentAddressController.text;
                                }
                              },
                              decoration: inputDecoration("Enter Current Address"),
                            ),

                            const SizedBox(height: 16),

                            Text("Permanent Address", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: permanentAddressController,
                              maxLines: 2,
                              decoration: inputDecoration("Enter Permanent Address"),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Checkbox(
                                  value: sameAddress,
                                  onChanged: (v) => handleSameAddress(v!),
                                  activeColor: AppColors.accent,
                                ),
                                const Text(
                                  "Same as Current Address",
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),

                            const Divider(height: 32, thickness: 1, color: Color(0xFFF0F0F0)),

                            const Text(
                              "Emergency Contact",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),

                            Text("Emergency Contact Name", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: emergencyNameController,
                              decoration: inputDecoration("Enter Contact Person Name"),
                            ),

                            const SizedBox(height: 16),

                            Text("Emergency Contact Relationship", style: labelStyle),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE5E5E5)),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: relation.isEmpty ? null : relation,
                                  isExpanded: true,
                                  hint: const Text(
                                    "Select Relation",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                  ),
                                  items: ["Father", "Mother", "Brother", "Sister"]
                                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                      .toList(),
                                  onChanged: (v) => setState(() => relation = v!),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text("Emergency Contact Number", style: labelStyle),
                            const SizedBox(height: 8),
                            TextField(
                              controller: emergencyNumberController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: inputDecoration("Enter Emergency Contact Number"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              color: AppColors.background,
              child: Row(
                children: [
                  Expanded(
                    child: _buildNavButton(
                      label: "Previous",
                      icon: Icons.arrow_back,
                      isNext: false,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildNavButton(
                      label: "Next",
                      icon: Icons.arrow_forward,
                      isNext: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterStep2Screen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({required String label, required IconData icon, required bool isNext, required VoidCallback onTap}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: isNext ? const Color(0xFFFFF8E9) : const Color(0xFFE5E1DA),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isNext) Icon(icon, size: 18, color: const Color(0xFF6B6B6B)),
              if (!isNext) const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isNext ? const Color(0xFFF8A709) : const Color(0xFF6B6B6B),
                ),
              ),
              if (isNext) const SizedBox(width: 8),
              if (isNext) Icon(icon, size: 18, color: const Color(0xFFF8A709)),
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
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}