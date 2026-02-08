import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/info_row.dart';
import 'reports/nearby_property_summary.dart';

class AcceptedLeadDetailsScreen extends StatelessWidget {
  const AcceptedLeadDetailsScreen({super.key});

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
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text("Accepted",
                            style: TextStyle(
                                color: Colors.green,
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
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
            const Text("Travel Info", style: AppTextStyles.sectionTitle),
            const SizedBox(height: 12),
            const AppCard(
              child: Column(
                children: [
                  InfoRow(
                      label: "Distance from current location", value: "4.2 km"),
                  InfoRow(label: "Estimated travel time", value: "15 min"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NearbyPropertySummaryScreen()),
                );
              },
              child: const Text("View Nearby Property Summary"),
            ),
          ],
        ),
      ),
    );
  }
}
