import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/info_row.dart';

class CompletedLeadDetailsScreen extends StatelessWidget {
  const CompletedLeadDetailsScreen({super.key});

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
            const Text("Property Details", style: AppTextStyles.sectionTitle),
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
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Completed",
                            style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const InfoRow(
                      label: "Address",
                      value:
                      "11 Sector, A-51D, Pratap Nagar,\nJodhpur, Rajasthan"),
                  const InfoRow(label: "Property Type", value: "Residential"),
                  const InfoRow(label: "Occupancy", value: "Owner"),
                  const InfoRow(label: "Build up Area", value: "1420 sq ft"),
                  const InfoRow(label: "Plot Area", value: "1800 sq ft"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Client Details", style: AppTextStyles.sectionTitle),
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
            const Text("Valuation Summary",
                style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            const AppCard(
              child: Column(
                children: [
                  InfoRow(label: "Land Rate Used", value: "₹1900 per sq ft"),
                  InfoRow(
                      label: "Construction Rate Used",
                      value: "₹1450 per sq ft"),
                  InfoRow(label: "Depreciation Applied", value: "10%"),
                  InfoRow(
                      label: "Final Estimated Property Value",
                      value: "₹52,80,000"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Market Reference summary",
                style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            const AppCard(
              child: Column(
                children: [
                  InfoRow(label: "Local Market Enquiry Rate", value: "₹1950"),
                  InfoRow(label: "Customer Stated Rate", value: "₹2000"),
                  InfoRow(
                      label: "DLC / Guideline Rate Considered",
                      value: "₹1650"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Visit Details", style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),

            const AppCard(
              child: Column(
                children: [
                  InfoRow(label: "Visit Date", value: "25 Jan, 2026"),
                  InfoRow(label: "Time Spent on Site", value: "1 hr 35 mins"),
                  InfoRow(label: "Total Distance Travelled", value: "18.4 km"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Officer Remark:",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const Text(
                "Property located in a well-developed residential colony with good road access. Construction quality is average to good. No visible structural damage. Market activity in surrounding area is stable."),
            const SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  foregroundColor: Colors.purple,
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text("Share Report"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text("View Full Report"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
