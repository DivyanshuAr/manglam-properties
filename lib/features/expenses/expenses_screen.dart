import 'package:flutter/material.dart';
import '../search/search_screen.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExpenseItem> expenses = [
      ExpenseItem(),
      ExpenseItem(),
      ExpenseItem(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Expenses",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_) => const SearchScreen(),
                  ),
                );
              },
              child: const Icon(Icons.search, color: Colors.black),
            ),
          )

        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: expenses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, index) {
          final item = expenses[index];
          return _ExpenseCard(item: item);
        },
      ),
    );
  }
}

class ExpenseItem {
  final String caseId;
  final String visitDate;
  final String visitTime;
  final String distance;
  final String rate;
  final String total;

  ExpenseItem({
    this.caseId = "#123456",
    this.visitDate = "26 Jan, 2026",
    this.visitTime = "10:20 AM – 12:05 PM",
    this.distance = "18.4 km",
    this.rate = "₹10 / km",
    this.total = "₹249",
  });
}

class _ExpenseCard extends StatelessWidget {
  final ExpenseItem item;

  const _ExpenseCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Case: ${item.caseId}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Visit Date", item.visitDate),
              _info("Visit Date", item.visitTime),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("Distance Covered", item.distance),
              _info("Rate Applied", item.rate),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Claimed Amount",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                item.total,
                style: const TextStyle(
                  color: Color(0xFFE6A73B),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
