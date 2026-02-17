import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpensesScreenV2 extends StatefulWidget {
  const ExpensesScreenV2({super.key});

  @override
  State<ExpensesScreenV2> createState() => _ExpensesScreenV2State();
}

class _ExpensesScreenV2State extends State<ExpensesScreenV2> {
  String selectedMonth = "January";
  String selectedYear = "2026";

  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  final List<String> years = ["2024", "2025", "2026", "2027", "2028"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          "Payroll Computation",
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFFF2F2F2),
                        child: null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jatin Singh",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const Text(
                              "Employee ID: 98745AD",
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              "Field Valuation Officer",
                              style: TextStyle(
                                color: Color(0xFF4A4A4A),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Technical Valuation  |  Jodhpur (Site Based)",
                              style: TextStyle(
                                color: Color(0xFF8E8E8E),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(color: Color(0xFFF2F2F2), thickness: 1),
                  ),
                  Row(
                    children: [
                      _buildDropdown("Month:", selectedMonth, months, (val) {
                        setState(() => selectedMonth = val!);
                      }),
                      const SizedBox(width: 10),
                      _buildDropdown("Year:", selectedYear, years, (val) {
                        setState(() => selectedYear = val!);
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _statBox("31", "Total Working Days", const Color(0xFFFFE8DE), const Color(0xFFFF6411)),
                const SizedBox(width: 10),
                _statBox("2", "Paid Leaves", const Color(0xFFDEE4FB), const Color(0xFF4376C9)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _statBox("29", "Days Present", const Color(0xFFC9E8E3), const Color(0xFF02806E)),
                const SizedBox(width: 10),
                _statBox("0", "Absent Days", const Color(0xFFFFE3F4), const Color(0xFF471B36)),
                const SizedBox(width: 10),
                _statBox("5", "Leaves Left", const Color(0xFFE3FBFF), const Color(0xFF339299)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Salary Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _row("Monthly Fixed Salary", "₹28,500"),
                  _row("Payable Days", "31/31"),
                  _row("Per Day Salary", "₹1,096"),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Color(0xFFF2F2F2), thickness: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Final Payable Salary",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8E8E8E),
                        ),
                      ),
                      const Text(
                        "₹2,28,500",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFEEA02C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Payment Status",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _statusRow("assets/expenses/status.svg", "Status", "Credited", const Color(0xFF02806E), useOriginalColor: true),
                  _statusRow("assets/expenses/salary.svg", "Salary Credited On", "5 Feb, 2026", const Color(0xFF1A1A1A)),
                  _statusRow("assets/expenses/payment.svg", "Payment Mode", "Bank Transfer", const Color(0xFF1A1A1A)),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Color(0xFFF2F2F2), thickness: 1),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Note: ",
                          style: TextStyle(
                            color: Color(0xFFEEA02C),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: "Full salary paid as per attendance.",
                          style: TextStyle(
                            color: Color(0xFF8E8E8E),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, Function(String?) onChanged) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEEEEEE), width: 0.5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: Color(0xFF666666)),
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((String item) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$label $value",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                );
              }).toList();
            },
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget _statBox(String val, String label, Color bg, Color text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              val,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: text,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: text.withOpacity(0.85),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8E8E8E),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            val,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusRow(String svgAsset, String label, String val, Color valColor, {bool useOriginalColor = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,
            width: 16,
            height: 16,
            colorFilter: useOriginalColor
                ? null
                : const ColorFilter.mode(Color(0xFF8E8E8E), BlendMode.srcIn),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8E8E8E),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            val,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valColor,
            ),
          ),
        ],
      ),
    );
  }
}

