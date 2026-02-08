import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_textfield.dart';
import 'valuation_step2.dart';

class ValuationStep1 extends StatefulWidget {
  const ValuationStep1({super.key});

  @override
  State<ValuationStep1> createState() => _ValuationStep1State();
}

class _ValuationStep1State extends State<ValuationStep1> {
  final _formKey = GlobalKey<FormState>();

  final bankController = TextEditingController();
  final visitDateController = TextEditingController();
  final customerNameController = TextEditingController();
  final mobileController = TextEditingController();
  final ownerController = TextEditingController();
  final meetPersonController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      visitDateController.text =
      "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Valuation Report"),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFEDE7DF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Step 1/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Case & Customer Details",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name of the Bank"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Select Bank Name",
                      controller: bankController,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),
                    const Text("Date of Technical Visit"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "dd-mm-yyyy",
                      controller: visitDateController,
                      readOnly: true,
                      onTap: _selectDate,
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),
                    const Text("Name of the Customer"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name",
                      controller: customerNameController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),
                    const Text("Mobile Number"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Mobile Number",
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      validator: (v) {
                        if (v == null || v.isEmpty) return "Required";
                        if (v.length != 10) return "Enter valid number";
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),
                    const Text("Owner’s Name"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name",
                      controller: ownerController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),
                    const Text("Person Meet Name and Contact No."),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name & Contact Number",
                      controller: meetPersonController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text("Previous"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // 🔥 less round
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ValuationStep2()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // 🔥 square look
                  ),
                ),
                child: const Text(
                  "Next →",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
