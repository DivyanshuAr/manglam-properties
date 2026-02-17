import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../notifications/notification_screen.dart';

class DashboardHomeV2 extends StatelessWidget {
  const DashboardHomeV2({super.key});

  String getFormattedDate() {
    final now = DateTime.now();
    const days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return "${days[now.weekday - 1]}, ${now.day} ${months[now.month - 1]} ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF8E9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Company Name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFD6A43B),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const NotificationScreen()),
                          ),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.notifications_none, color: Color(0xFFD6A43B), size: 24),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "You are Clocked In",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF1A1A1A)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              getFormattedDate(),
                              style: const TextStyle(color: Color(0xFF7A7A7A), fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD289),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.access_time, size: 14, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                "08:00hrs",
                                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF3AD44),
                                foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("Take a Break", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF1A1A1A), width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("Clock Out", style: TextStyle(color: Color(0xFF1A1A1A), fontSize: 15, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const _StatRow(),
                    const SizedBox(height: 24),
                    const _StartVisitBanner(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today’s Visits", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                        Text("View all Visits >", style: TextStyle(color: Color(0xFF7A7A7A), fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const _VisitCard(
                      title: "PV-JDP-2041",
                      subtitle: "Pal Road, Jodhpur",
                      status: "Accepted",
                      distance: "2.1 Km",
                      color: Color(0xFF6B3E57),
                    ),
                    const SizedBox(height: 12),
                    const _VisitCard(
                      title: "PV-JDP-2041",
                      subtitle: "Chopasni Housing Board",
                      status: "Due Today",
                      distance: "2.1 Km",
                      isDue: true,
                    ),
                    const SizedBox(height: 32),
                    const Text("Last 7 days Working Hours", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 16),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Chart Placeholder",
                          style: TextStyle(color: Color(0xFF7A7A7A), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _QuickAction("Add Expenses", "assets/dashboard/add.svg", Color(0xFFF3AD44)),
                        _QuickAction("Inspection\nGuidelines", "assets/dashboard/inspection.svg", Color(0xFF5D2E4A)),
                        _QuickAction("Call Supervisor", "assets/dashboard/call.svg", Color(0xFF4285F4)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _statBox("3", "New Leads", const Color(0xFFFFE8DE), const Color(0xFFFF6411)),
        const SizedBox(width: 8),
        _statBox("2", "Accepted", const Color(0xFFDEE4FB), const Color(0xFF4376C9)),
        const SizedBox(width: 8),
        _statBox("1", "In Progress", const Color(0xFFFFE3F4), const Color(0xFF471B36)),
        const SizedBox(width: 8),
        _statBox("1", "Completed", const Color(0xFFC9E8E3), const Color(0xFF02806E)),
      ],
    );
  }

  Widget _statBox(String count, String label, Color bg, Color text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(count, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: text)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: text)),
          ],
        ),
      ),
    );
  }
}

class _StartVisitBanner extends StatelessWidget {
  const _StartVisitBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5D2E4A), Color(0xFF321626)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start Next Visit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                SizedBox(height: 6),
                Text("Nearest accepted lead- 2.1 km away", style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Text("Start Visit", style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF321626))),
          )
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String title;
  final String image;
  final Color iconBg;

  const _QuickAction(this.title, this.image, this.iconBg);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(color: const Color(0xFFF9F9F9), borderRadius: BorderRadius.circular(16)),
          child: Center(child: SvgPicture.asset(image, width: 32)),
        ),
        const SizedBox(height: 10),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
      ],
    );
  }
}

class _VisitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String distance;
  final bool isDue;
  final Color? color;

  const _VisitCard({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.distance,
    this.isDue = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isDue ? const Color(0xFFFF5C5C) : (color ?? const Color(0xFF6B3E57));
    final bgColor = isDue ? const Color(0xFFFFF5F5) : const Color(0xFFF9F9F9);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.location_on, color: statusColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Color(0xFF7A7A7A), fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 6),
              Text(distance, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}