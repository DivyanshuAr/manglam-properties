import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class EducationExperienceScreen extends StatelessWidget {
  const EducationExperienceScreen({super.key});

  InputDecoration inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF7F7F7),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget gap([double h = 16]) => SizedBox(height: h);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // outer bg
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: false,
        title: const Text(
          "Education & Experience",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white, // white card like figma
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label("Highest Qualification"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(text: "B.Tech."),
              ),

              gap(),
              label("Institute / University"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(
                    text: "Indian Institute of Engineering"),
              ),

              gap(),
              label("Year of Passing"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(text: "2024"),
              ),

              gap(),
              label("Total Work Experience (in Years)"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(text: "5"),
              ),

              gap(),
              label("Previous Company Name"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(
                    text: "Shree Buildtech Consultants Pvt. Ltd."),
              ),

              gap(),
              label("Designation"),
              TextField(
                decoration: inputDecoration(),
                controller:
                TextEditingController(text: "Junior Site Engineer"),
              ),

              gap(),
              label("Employment Period (From–To)"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(
                    text: "July 2021 – August 2023"),
              ),

              gap(),
              label("Reason for Leaving"),
              TextField(
                decoration: inputDecoration(),
                controller: TextEditingController(
                    text: "Career Growth & Better Opportunity"),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Request Update",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
