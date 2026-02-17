import 'package:flutter/material.dart';
import '../search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    );
  }
}

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
        centerTitle: false,
        title: const Text(
          "Expenses",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
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
              child: const Icon(Icons.search, color: Colors.black, size: 22),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: expenses
              .map(
                (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ExpenseCard(item: item),
            ),
          )
              .toList(),
        ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Case: ${item.caseId}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _info("Visit Date", item.visitDate),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _info("Visit Date", item.visitTime),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _info("Distance Covered", item.distance),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _info("Rate Applied", item.rate),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Claimed Amount",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8E8E93),
                ),
              ),
              Text(
                item.total,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFE6A73B),
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
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8E8E93),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
