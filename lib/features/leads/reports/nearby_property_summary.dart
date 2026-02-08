import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/info_row.dart';

class NearbyPropertySummaryScreen extends StatelessWidget {
  const NearbyPropertySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("Nearby Property Summary",
            style: AppTextStyles.appBarTitle),
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Reference Property Info",
                  style: AppTextStyles.sectionTitle),
              SizedBox(height: 12),
              InfoRow(label: "Distance from this property", value: "150 m"),
              InfoRow(label: "Valuation Date", value: "16 Jan, 2026"),
              InfoRow(label: "Property Type", value: "Residential"),
              InfoRow(label: "Final Valuation Amount", value: "₹48,50,000"),
              InfoRow(label: "Land Rate Used", value: "₹1,850 per sq ft"),
              InfoRow(label: "Property Rate", value: "₹1,600 per sq ft"),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        color: AppColors.background,
        child: SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Back to Lead Details"),
          ),
        ),
      ),
    );
  }
}
