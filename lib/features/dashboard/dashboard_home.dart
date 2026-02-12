import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/app_text_styles.dart';
import '../notifications/notification_screen.dart';

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  String getFormattedDate() {
    final now = DateTime.now();
    const days = [
      "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"
    ];
    const months = [
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sep","Oct","Nov","Dec"
    ];
    return "${days[now.weekday - 1]}, ${now.day} ${months[now.month - 1]} ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final stats = [
      {"count": "3", "label": "New Leads", "color": const Color(0xFFE9DCD2)},
      {"count": "2", "label": "Accepted", "color": const Color(0xFFD6DEEE)},
      {"count": "1", "label": "In Progress", "color": const Color(0xFFE4D5E3)},
      {"count": "1", "label": "Completed", "color": const Color(0xFFD5E5E1)},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             // HEADER
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF4EEDF),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE0A23A),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const NotificationScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF1D6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.notifications_none,
                                color: Color(0xFFE0A23A), size: 20),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hello Jatin!",
                                style: AppTextStyles.heading),
                            const SizedBox(height: 4),
                            Text(
                              getFormattedDate(),
                              style: const TextStyle(
                                  color: Color(0xFF8E8E8E)),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/dashboard/hand.svg",
                          height: 80,
                        ),
                      ],
                    ),

                    const SizedBox(height: 0),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE0A23A),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Clock In"),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: stats.map((e) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: _StatCard(
                              e["count"] as String,
                              e["label"] as String,
                              e["color"] as Color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6B3E57), Color(0xFF34182B)],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Start Next Visit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold)),
                              SizedBox(height: 4),
                              Text(
                                  "Nearest accepted lead- 2.1 km away",
                                  style: TextStyle(
                                      color: Colors.white70)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(8),
                            ),
                            child: const Text("Start Visit"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //////////////////////////////////////////////////////
              /// BODY (WHITE AREA)
              //////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .05,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Today’s Visits",
                            style: AppTextStyles.sectionTitle),
                        Row(
                          children: [
                            Text("View all Visits",
                                style: TextStyle(
                                    color: Color(0xFF8E8E8E))),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios,
                                size: 14,
                                color: Color(0xFF8E8E8E)),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const _VisitCard(
                      title: "PV-JDP-2041",
                      subtitle: "Pal Road, Jodhpur",
                      status: "Accepted",
                      distance: "2.1 Km",
                    ),
                    const SizedBox(height: 10),
                    const _VisitCard(
                      title: "PV-JDP-2041",
                      subtitle: "Chopasni Housing Board",
                      status: "Due Today",
                      distance: "2.1 Km",
                      isDue: true,
                    ),

                    const SizedBox(height: 22),

                    const Text("Daily Working Hours",
                        style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 12),

                    Container(
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "Working hours chart will appear here",
                        style: TextStyle(
                            color: Color(0xFF8E8E8E)),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text("Quick Actions",
                        style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 12),

                    const Row(
                      children: [
                        _QuickAction("Add Expenses",
                            "assets/dashboard/add.svg"),
                        _QuickAction("Inspection\nGuidelines",
                            "assets/dashboard/inspection.svg"),
                        _QuickAction("Call Supervisor",
                            "assets/dashboard/call.svg"),
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

class _StatCard extends StatelessWidget {
  final String count;
  final String label;
  final Color color;

  const _StatCard(this.count, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String title;
  final String image;

  const _QuickAction(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SvgPicture.asset(image, width: 50),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _VisitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String distance;
  final bool isDue;

  const _VisitCard({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.distance,
    this.isDue = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDue ? Colors.red : const Color(0xFF6A1B4D);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Color(0xFF8E8E8E))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Text(status, style: TextStyle(color: color)),
              const SizedBox(height: 4),
              Text(distance),
            ],
          ),
        ],
      ),
    );
  }
}
