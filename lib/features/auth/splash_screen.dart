import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> scaleAnim;
  late Animation<Offset> moveAnim;
  late Animation<double> nameOpacity;
  late Animation<Offset> nameSlide;

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    /// M big → small
    scaleAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.8, end: 1.8),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.8, end: 1.0),
        weight: 40,
      ),
    ]).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    /// M move center → left
    moveAnim = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: Offset.zero, end: Offset.zero),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Offset.zero, end: const Offset(-0.25, 0)),
        weight: 40,
      ),
    ]).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    /// Name fade
    nameOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.55, 0.85, curve: Curves.ease),
      ),
    );

    /// Name slide
    nameSlide = Tween<Offset>(
      begin: const Offset(0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.55, 0.85, curve: Curves.easeOut),
      ),
    );

    start();
  }

  void start() async {
    /// STEP 1 → only gradient screen
    await Future.delayed(const Duration(milliseconds: 700));

    setState(() => startAnimation = true);

    /// STEP 2 & 3 → run animation
    await controller.forward();

    /// STEP 4 → go onboarding
    await Future.delayed(const Duration(milliseconds: 600));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF7F4EE),
              Color(0xFFE4B54C),
            ],
          ),
        ),
        child: Center(
          child: startAnimation
              ? AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// M LOGO
                  SlideTransition(
                    position: moveAnim,
                    child: Transform.scale(
                      scale: scaleAnim.value,
                      child: Image.asset(
                        "assets/logo/main.png",
                        height: 70,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// NAME
                  SlideTransition(
                    position: nameSlide,
                    child: FadeTransition(
                      opacity: nameOpacity,
                      child: Image.asset(
                        "assets/logo/main2.png",
                        height: 34,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
              : const SizedBox(), // blank gradient
        ),
      ),
    );
  }
}
