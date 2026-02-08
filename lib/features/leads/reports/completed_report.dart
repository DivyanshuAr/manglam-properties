import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CompletedReportScreen extends StatelessWidget {
  const CompletedReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text("Valuation Report",
            style: TextStyle(color: AppColors.textPrimary)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _card("Valuation Summary", [
              _row("Land Rate Used", "₹1900 per sq ft"),
              _row("Construction Rate", "₹1450 per sq ft"),
              _row("Final Value", "₹52,80,000"),
            ]),
            const SizedBox(height: 16),
            _card("Market Reference", [
              _row("Local Market Rate", "₹1950 per sq ft"),
              _row("Customer Stated Rate", "₹2000 per sq ft"),
            ]),
            const SizedBox(height: 16),
            _card("Visit Details", [
              _row("Visit Date", "25 Jan, 2026"),
              _row("Time Spent", "1 hr 35 mins"),
              _row("Distance Travelled", "18.4 km"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, List<Widget> children) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...children
      ],
    ),
  );

  Widget _row(String title, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    ),
  );
}
