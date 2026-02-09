import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_textfield.dart';
import '../../core/widgets/bottom_action_buttons.dart';
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

      ///  APP BAR
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          "Valuation Report",
          style: AppTextStyles.appBarTitle,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.save_outlined, color: Colors.black87),
          ),
        ],
      ),


      body: Column(
        children: [
          ///  STEP HEADER
          Container(
            width: double.infinity,
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFF1ECE6),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Step 1/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Case & Customer Details",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              ],
            ),
          ),

          ///  FORM
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
                    /// Bank
                    const Text("Name of the Bank"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Select Bank Name",
                      controller: bankController,
                      suffixIcon:
                      const Icon(Icons.keyboard_arrow_down),
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),

                    /// Date
                    const Text("Date of Technical Visit"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "dd-mm-yyyy",
                      controller: visitDateController,
                      readOnly: true,
                      onTap: _selectDate,
                      suffixIcon: const Icon(
                          Icons.calendar_today_outlined),
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),

                    /// Customer
                    const Text("Name of the Customer"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name",
                      controller: customerNameController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),

                    /// Mobile
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

                    /// Owner
                    const Text("Owner’s Name"),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name",
                      controller: ownerController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 16),

                    /// Meet person
                    const Text("Person Meet Name and Contact No."),
                    const SizedBox(height: 6),
                    AppTextField(
                      hint: "Enter Full Name & Contact Number",
                      controller: meetPersonController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      ///  FIGMA STYLE BUTTONS
      bottomNavigationBar: BottomActionButtons(
        onPrevious: () => Navigator.pop(context),
        onNext: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ValuationStep2(),
              ),
            );
          }
        },
      ),
    );
  }
}
