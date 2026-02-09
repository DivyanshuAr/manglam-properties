import 'package:flutter/material.dart';
import 'package:manglam_engineers/features/valution/valuation_step7.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_textfield.dart';
import '../../core/widgets/bottom_action_buttons.dart';

class ValuationStep6 extends StatefulWidget {
  const ValuationStep6({super.key});

  @override
  State<ValuationStep6> createState() => _ValuationStep6State();
}

class _ValuationStep6State extends State<ValuationStep6> {
  final customerNameController = TextEditingController();
  final customerRateController = TextEditingController();

  final localNameController = TextEditingController();
  final localRateController = TextEditingController();

  final selfNameController = TextEditingController();
  final selfRateController = TextEditingController();

  final remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Valuation Report",
          style: AppTextStyles.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined, color: Colors.black87),
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFF1ECE6),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Step 6/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Market Rates & Valuation Inputs",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Market Rate with Contact No. & Any Transaction",
                    style: AppTextStyles.sectionTitle,
                  ),
                  const SizedBox(height: 12),

                  _rateCard(
                    title: "as per Customer",
                    nameController: customerNameController,
                    rateController: customerRateController,
                  ),
                  _rateCard(
                    title: "as per Local Enquiry",
                    nameController: localNameController,
                    rateController: localRateController,
                  ),
                  _rateCard(
                    title: "Self Assessment",
                    nameController: selfNameController,
                    rateController: selfRateController,
                  ),

                  _label("Visited by"),
                  _dropdown("Select"),

                  _label("Remarks"),
                  AppTextField(
                    hint: "Enter Remarks",
                    controller: remarksController,
                    maxLines: 4,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomActionButtons(
        onPrevious: () => Navigator.pop(context),
        onNext: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ValuationStep7()),
          );
        },
      ),
    );
  }

  Widget _rateCard({
    required String title,
    required TextEditingController nameController,
    required TextEditingController rateController,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.label),
          const SizedBox(height: 10),
          AppTextField(
            hint: "Name & Contact No.",
            controller: nameController,
          ),
          const SizedBox(height: 10),
          AppTextField(
            hint: "Rate",
            controller: rateController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(text, style: AppTextStyles.label),
    );
  }

  Widget _dropdown(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
