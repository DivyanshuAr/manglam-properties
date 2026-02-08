import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/info_row.dart';
import 'rejection_reason.dart';
import '../valution/valuation_step1.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Lead Details", style: AppTextStyles.appBarTitle),
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: 20,
        ),
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
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const InfoRow(
                    label: "Address",
                    value:
                    "11 Sector, A-51D, Pratap Nagar,\nJodhpur, Rajasthan",
                  ),
                  const InfoRow(
                    label: "Assigned Date",
                    value: "24 Jan, 2024",
                  ),
                  const InfoRow(
                    label: "Landmark",
                    value: "Near Children's School",
                  ),
                  const InfoRow(
                    label: "Property Type",
                    value: "Residential",
                  ),
                  const InfoRow(
                    label: "Area",
                    value: "1500 sq ft",
                  ),
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
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RejectionReasonScreen(),
                      ),
                    );
                  },
                  child: const Text("✕ Reject"),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade50,
                    foregroundColor: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ValuationStep1(),
                      ),
                    );
                  },
                  child: const Text("✓ Accept"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
