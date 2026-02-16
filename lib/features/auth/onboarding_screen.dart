import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int page = 0;

  final List<_OnboardData> items = const [
    _OnboardData(
      image: "assets/onboard/onboard1.png",
      title: "Manage Your Field Visits\nEasily",
      subtitle:
      "View assigned leads, accept visits, and complete property inspections directly from the app.",
      button: "Next →",
      overlays: [],
    ),
    _OnboardData(
      image: "assets/onboard/onboard2.png",
      title: "Track Visits & Expenses",
      subtitle:
      "Automatically track distance, visit time, and manage your work details in one place.",
      button: "Next →",
      overlays: [],
    ),
    _OnboardData(
      image: "assets/onboard/onboard3.png",
      title: "Salary & Work Insights",
      subtitle:
      "Check attendance, monthly salary details, and stay updated with real-time notifications.",
      button: "Get Started",
      overlays: [],
    ),
  ];

  void next() {
    if (page < items.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            /// LOGO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 36,
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// PAGES
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: items.length,
                onPageChanged: (i) => setState(() => page = i),
                itemBuilder: (_, i) {
                  final data = items[i];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        /// IMAGE WITH OVERLAYS
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  image: DecorationImage(
                                    image: AssetImage(data.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              /// OVERLAYS
                              ...data.overlays.map((e) {
                                return Positioned(
                                  left: e.left,
                                  right: e.right,
                                  top: e.top,
                                  bottom: e.bottom,
                                  child: e.child,
                                );
                              }).toList(),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        /// TITLE
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// SUBTITLE
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            data.subtitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B6B6B),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                    (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: page == i ? 26 : 6,
                  decoration: BoxDecoration(
                    color: page == i
                        ? const Color(0xFF4B164C)
                        : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 26),

            /// BUTTON
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: next,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    items[page].button,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final String image;
  final String title;
  final String subtitle;
  final String button;
  final List<_OverlayData> overlays;

  const _OnboardData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.button,
    required this.overlays,
  });
}

class _OverlayData {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Widget child;

  const _OverlayData({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.child,
  });
}
