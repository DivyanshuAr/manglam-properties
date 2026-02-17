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
    ),
    _OnboardData(
      image: "assets/onboard/onboard2.png",
      title: "Track Visits & Expenses",
      subtitle:
      "Automatically track distance, visit time, and manage your work details in one place.",
      button: "Next →",
    ),
    _OnboardData(
      image: "assets/onboard/onboard3.png",
      title: "Salary & Work Insights",
      subtitle:
      "Check attendance, monthly salary details, and stay updated with real-time notifications.",
      button: "Get Started",
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
      backgroundColor: const Color(0xFFFFF8E9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo/main.png",
                    height: 36,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    "assets/logo/main2.png",
                    height: 22,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: items.length,
                onPageChanged: (i) => setState(() => page = i),
                itemBuilder: (_, i) {
                  final data = items[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              image: DecorationImage(
                                image: AssetImage(data.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12),
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
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                    (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: page == i ? 26 : 6,
                  decoration: BoxDecoration(
                    color: page == i
                        ? const Color(0xFFF3AD44)
                        : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding:
              const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: next,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFF3AD44),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
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

  const _OnboardData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.button,
  });
}