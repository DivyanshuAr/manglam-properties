import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manglam_engineers/features/valution/valuation_step6.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/bottom_action_buttons.dart';

class ValuationStep5 extends StatefulWidget {
  const ValuationStep5({super.key});

  @override
  State<ValuationStep5> createState() => _ValuationStep5State();
}

class _ValuationStep5State extends State<ValuationStep5> {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<void> pickVideo() async {
    await _picker.pickVideo(source: ImageSource.gallery);
  }

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
            MaterialPageRoute(builder: (_) => const ValuationStep6()),
          );
        },
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
        GestureDetector(
          onTap: () {
            if (video) {
              pickVideo();
            } else {
              pickImage();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  video ? "Upload Video" : "Upload Photo",
                  style: const TextStyle(color: Colors.grey),
                ),
                Icon(
                  video ? Icons.videocam_outlined : Icons.image_outlined,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
