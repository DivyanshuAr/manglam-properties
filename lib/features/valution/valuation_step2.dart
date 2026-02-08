import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_textfield.dart';
import 'valuation_step3.dart';

class ValuationStep2 extends StatefulWidget {
  const ValuationStep2({super.key});

  @override
  State<ValuationStep2> createState() => _ValuationStep2State();
}

class _ValuationStep2State extends State<ValuationStep2> {
  final _formKey = GlobalKey<FormState>();

  final docAddressController = TextEditingController();
  final actualAddressController = TextEditingController();
  final landmarkController = TextEditingController();
  final railwayController = TextEditingController();
  final railwayDistanceController = TextEditingController();
  final busStandController = TextEditingController();
  final busDistanceController = TextEditingController();
  final hospitalController = TextEditingController();
  final hospitalDistanceController = TextEditingController();
  final developmentController = TextEditingController();
  final roadWidthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text("Valuation Report"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined, color: Colors.black),
          ),
        ],
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
                Text("Step 2/7",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Property Location & Surroundings",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
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

                    _label("Address of the Property (as per documents)"),
                    AppTextField(
                      hint: "Enter Address",
                      controller: docAddressController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    _label("Address of the Property (as per actual)"),
                    AppTextField(
                      hint: "Enter Address",
                      controller: actualAddressController,
                      validator: (v) =>
                      v == null || v.isEmpty ? "Required" : null,
                    ),

                    _label("Nearest Landmark / Colony / Ward"),
                    AppTextField(
                      hint: "Enter Landmark/Colony/Ward",
                      controller: landmarkController,
                    ),

                    _label("Nearest Railway Station Name"),
                    AppTextField(
                      hint: "Enter nearest railway station name",
                      controller: railwayController,
                    ),

                    _label("Railway Station Distance (in Km)"),
                    AppTextField(
                      hint: "Enter distance of railway station from property",
                      controller: railwayDistanceController,
                      keyboardType: TextInputType.number,
                    ),

                    _label("Nearest Bus Stand Name"),
                    AppTextField(
                      hint: "Enter nearest bus stand name",
                      controller: busStandController,
                    ),

                    _label("Bus Stand Distance (in Km)"),
                    AppTextField(
                      hint: "Enter distance of bus stand from property",
                      controller: busDistanceController,
                      keyboardType: TextInputType.number,
                    ),

                    _label("Nearest Hospital"),
                    AppTextField(
                      hint: "Enter nearest hospital name",
                      controller: hospitalController,
                    ),

                    _label("Hospital Distance (in Km)"),
                    AppTextField(
                      hint: "Enter distance of hospital from property",
                      controller: hospitalDistanceController,
                      keyboardType: TextInputType.number,
                    ),

                    _label("Locality"),
                    _dropdownField("Select Locality"),

                    _label("Community Dominant"),
                    _dropdownField("Select Community Dominant"),

                    _label("Special Remark"),
                    _dropdownField("Select Remark"),

                    _label("Surrounding Development (in %)"),
                    AppTextField(
                      hint: "Enter Surrounding Development",
                      controller: developmentController,
                      keyboardType: TextInputType.number,
                    ),

                    _label("Road Width/ Distance from Road Center (in ft.)"),
                    AppTextField(
                      hint: "Enter road width",
                      controller: roadWidthController,
                    ),

                    const SizedBox(height: 90),
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
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  side: const BorderSide(color: Color(0xFFFFF3E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
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
                          builder: (_) => const ValuationStep3()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text("Next →",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(text, style: AppTextStyles.label),
    );
  }

  Widget _dropdownField(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }
}
