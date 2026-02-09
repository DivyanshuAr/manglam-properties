import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_textfield.dart';
import '../../core/widgets/bottom_action_buttons.dart';
import '../valution/valuation_step5.dart';

class ValuationStep4 extends StatefulWidget {
  const ValuationStep4({super.key});

  @override
  State<ValuationStep4> createState() => _ValuationStep4State();
}

class _ValuationStep4State extends State<ValuationStep4> {
  final meterOnMeterController = TextEditingController();
  final meterOnBillController = TextEditingController();
  final nameOnMeterController = TextEditingController();
  final nameOnBillController = TextEditingController();

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
                Text("Step 4/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Utilities & Services",
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
                  _label("Electric Meter no. with Name"),
                  _card(
                    children: [
                      _subLabel("Meter no."),
                      AppTextField(
                        hint: "On Meter",
                        controller: meterOnMeterController,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        hint: "On Bill",
                        controller: meterOnBillController,
                      ),
                    ],
                  ),

                  _label("Name & Address"),
                  _card(
                    children: [
                      AppTextField(
                        hint: "On Meter",
                        controller: nameOnMeterController,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        hint: "On Bill",
                        controller: nameOnBillController,
                      ),
                    ],
                  ),

                  _label("Electric Meter No."),
                  _dropdown("Select"),

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
            MaterialPageRoute(
              builder: (_) => const ValuationStep5(),
            ),
          );
        },
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(text, style: AppTextStyles.label),
    );
  }

  Widget _subLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _card({required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _dropdown(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
