import 'package:flutter/material.dart';
import 'package:manglam_engineers/features/valution/valuation_step6.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ValuationStep5 extends StatefulWidget {
  const ValuationStep5({super.key});

  @override
  State<ValuationStep5> createState() => _ValuationStep5State();
}

class _ValuationStep5State extends State<ValuationStep5> {
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
                Text("Step 5/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Photos, Videos & Site Proof",
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
                  uploadField("Internal Photos"),
                  uploadField("Internal Photos Additional", optional: true),
                  uploadField("Selfie"),
                  uploadField("External Photos"),
                  uploadField("External Photos Additional", optional: true),
                  uploadField("Approach Road"),
                  uploadField("Google Map"),
                  uploadField("Compass"),
                  uploadField("Electricity Bill"),
                  uploadField("Electricity Meter"),
                  uploadField("Site Plan"),
                  uploadField("Video Upload (Internal)",
                      optional: true, video: true),
                  uploadField(
                    "Video Upload (External with Critical & all Corners)",
                    optional: true,
                    video: true,
                  ),
                  const SizedBox(height: 90),
                ],
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
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ValuationStep6()),
                  );
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

  Widget uploadField(String title,
      {bool optional = false, bool video = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + (optional ? " (Optional)" : ""),
          style: AppTextStyles.label,
        ),
        const SizedBox(height: 6),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                video ? "Upload Video (Optional)" : "Upload Photo",
                style: const TextStyle(color: Colors.grey),
              ),
              Icon(
                video
                    ? Icons.video_call_outlined
                    : Icons.image_outlined,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
