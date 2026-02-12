import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GovernmentBankingScreen extends StatelessWidget {
  const GovernmentBankingScreen({super.key});

  InputDecoration inputDecoration(String value) {
    return InputDecoration(
      hintText: value,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF5A5A5A),
      ),
      filled: true,
      fillColor: const Color(0xFFF8F6F2),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
    );
  }

  Widget pdfTile(String name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E7CF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE0A23A),
            ),
          ),
        ],
      ),
    );
  }

  Widget readOnlyField(String value) {
    return TextField(
      readOnly: true,
      decoration: inputDecoration(value),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF5A5A5A),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6B6B6B),
        ),
      ),
    );
  }

  Widget idRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B6B6B),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Government & Banking Details",
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
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              idRow("Aadhaar Number", "**** **** 8976"),
              pdfTile("aadhar.pdf"),
              const SizedBox(height: 20),
              idRow("PAN Number", "SDFGH894V"),
              pdfTile("pan card.pdf"),
              const SizedBox(height: 20),
              label("Bank Account Holder Name"),
              readOnlyField("Jatin Singh"),
              const SizedBox(height: 16),
              label("Bank Name"),
              readOnlyField("United Bank of India"),
              const SizedBox(height: 16),
              label("Account Number"),
              readOnlyField("1248756532548759"),
              const SizedBox(height: 16),
              label("IFSC Code"),
              readOnlyField("UNIB56481200"),
              const SizedBox(height: 16),
              label("UAN Number"),
              readOnlyField("875412036925"),
              const SizedBox(height: 16),
              label("ESIC Number"),
              readOnlyField("1234567890"),
            ],
          ),
        ),
      ),
    );
  }
}
