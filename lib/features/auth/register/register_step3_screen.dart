import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'register_step4_screen.dart';

class RegisterStep3Screen extends StatefulWidget {
  const RegisterStep3Screen({super.key});

  @override
  State<RegisterStep3Screen> createState() => _RegisterStep3ScreenState();
}

class _RegisterStep3ScreenState extends State<RegisterStep3Screen> {
  String qualification = "";
  String yearPassing = "";

  final TextEditingController instituteController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController periodController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

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
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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

  Future<void> pickPeriod() async {
    final from = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (from == null) return;

    final to = await showDatePicker(
      context: context,
      firstDate: from,
      lastDate: DateTime.now(),
      initialDate: from,
    );

    if (to == null) return;

    periodController.text =
    "${from.day}/${from.month}/${from.year} - "
        "${to.day}/${to.month}/${to.year}";
  }

  @override
  void dispose() {
    instituteController.dispose();
    experienceController.dispose();
    companyController.dispose();
    designationController.dispose();
    periodController.dispose();
    reasonController.dispose();
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
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Step Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "3/5",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Education & Experience",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Text("Highest Qualification", style: labelStyle),
                          const SizedBox(height: 8),
                          _dropdownQualification(),

                          const SizedBox(height: 16),
                          Text("Institute / University", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: instituteController,
                            decoration: inputDecoration(
                                "Enter Institute / University Name"),
                          ),

                          const SizedBox(height: 16),
                          Text("Year of Passing", style: labelStyle),
                          const SizedBox(height: 8),
                          _dropdownYear(),

                          const SizedBox(height: 16),
                          Text("Total Work Experience (in Years)",
                              style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: experienceController,
                            decoration:
                            inputDecoration("Enter Experience"),
                          ),

                          const SizedBox(height: 16),
                          Text("Previous Company Name", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: companyController,
                            decoration: inputDecoration(
                                "Enter Previous Company Name"),
                          ),

                          const SizedBox(height: 16),
                          Text("Designation", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: designationController,
                            decoration: inputDecoration(
                                "Enter Designation in Previous Company"),
                          ),

                          const SizedBox(height: 16),
                          Text("Employment Period (From–To)",
                              style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: periodController,
                            readOnly: true,
                            onTap: pickPeriod,
                            decoration: inputDecoration(
                              "Select Employment Period",
                              suffix: const Icon(
                                Icons.calendar_today_outlined,
                                size: 18,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          Text("Reason for Leaving", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: reasonController,
                            maxLines: 3,
                            decoration:
                            inputDecoration("Enter Reason for Leaving"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: _btn(
                      text: "← Previous",
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _btn(
                      text: "Next →",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterStep4Screen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _btn({required String text, required VoidCallback onTap}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownQualification() {
    return _dropdown(
      hint: "Select Qualification",
      value: qualification.isEmpty ? null : qualification,
      items: ["10th", "12th", "Graduate", "Post Graduate"],
      onChanged: (v) => setState(() => qualification = v!),
    );
  }

  Widget _dropdownYear() {
    return _dropdown(
      hint: "Select Year of Passing",
      value: yearPassing.isEmpty ? null : yearPassing,
      items: List.generate(
        40,
            (index) => (DateTime.now().year - index).toString(),
      ),
      onChanged: (v) => setState(() => yearPassing = v!),
    );
  }

  Widget _dropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(
          hint,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF9A9A9A),
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
