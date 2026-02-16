import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import 'registerStep5Screen.dart';

class RegisterStep4Screen extends StatefulWidget {
  const RegisterStep4Screen({super.key});

  @override
  State<RegisterStep4Screen> createState() => _RegisterStep4ScreenState();
}

class _RegisterStep4ScreenState extends State<RegisterStep4Screen> {
  final ImagePicker picker = ImagePicker();

  XFile? aadhaar;
  XFile? pan;
  XFile? cheque;
  XFile? education;
  XFile? experience;
  XFile? photo;

  Future<void> pick(Function(XFile) onPick) async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() => onPick(file));
    }
  }

  TextStyle labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B6B6B),
  );

  Widget uploadTile({
    required String title,
    required XFile? file,
    required VoidCallback onTap,
    String? helper,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelStyle),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E5E5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    file == null ? "Upload Document" : file.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: file == null
                          ? const Color(0xFF9A9A9A)
                          : Colors.black,
                    ),
                  ),
                ),
                const Icon(Icons.image_outlined,
                    color: Colors.orange, size: 20),
              ],
            ),
          ),
        ),
        if (helper != null) ...[
          const SizedBox(height: 6),
          Text(
            helper,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9A9A9A),
            ),
          ),
        ],
      ],
    );
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
                        color: Colors.black,
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
                        border:
                        Border.all(color: const Color(0xFFE5E5E5)),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Step Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "4/5",
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
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Document Upload",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title: "Aadhaar Card",
                            file: aadhaar,
                            helper: "File must be in PDF/JPG format",
                            onTap: () => pick((f) => aadhaar = f),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title: "PAN Card",
                            file: pan,
                            onTap: () => pick((f) => pan = f),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title: "Cancelled Cheque / Bank Proof",
                            file: cheque,
                            onTap: () => pick((f) => cheque = f),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title: "Educational Certificates",
                            file: education,
                            onTap: () => pick((f) => education = f),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title:
                            "Experience / Relieving Letter (if any)",
                            file: experience,
                            onTap: () => pick((f) => experience = f),
                          ),
                          const SizedBox(height: 16),
                          uploadTile(
                            title: "Passport Size Photograph",
                            file: photo,
                            onTap: () => pick((f) => photo = f),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
              const EdgeInsets.fromLTRB(16, 10, 16, 16),
              color: AppColors.background,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => Navigator.pop(context),
                        child: const Center(
                          child: Text(
                            "← Previous",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const RegisterStep5Screen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Next →",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
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
}
