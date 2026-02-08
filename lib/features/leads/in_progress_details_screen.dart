import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/info_row.dart';


class InProgressDetailsScreen extends StatelessWidget {
  const InProgressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Lead Details", style: AppTextStyles.appBarTitle),
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Steps Covered",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("2/5",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Property Details",
                style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Case: #123456",
                          style: AppTextStyles.cardTitle),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("In Progress",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const InfoRow(
                      label: "Address",
                      value:
                      "11 Sector, A-51D, Pratap Nagar,\nJodhpur, Rajasthan"),
                  const InfoRow(label: "Assigned Date", value: "24 Jan, 2024"),
                  const InfoRow(
                      label: "Landmark", value: "Near Children's School"),
                  const InfoRow(label: "Property Type", value: "Residential"),
                  const InfoRow(label: "Area", value: "1500 sq ft"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Client Details",
                style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            const AppCard(
              child: Column(
                children: [
                  InfoRow(label: "Client Name", value: "Rahul Singh"),
                  InfoRow(
                      label: "Contact Person Name", value: "Sudesh Mishra"),
                  InfoRow(label: "Contact Number", value: "+91 9876543210"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Travel Info",
                style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            const AppCard(
              child: Column(
                children: [
                  InfoRow(label: "Started at", value: "2hr 15 min ago"),
                  InfoRow(label: "Time spent on site", value: "45 min"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
