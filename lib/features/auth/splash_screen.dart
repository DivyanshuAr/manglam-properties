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
      duration: const Duration(milliseconds: 2000),
    );

    scaleAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.5).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.5, end: 1.0),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.0),
        weight: 30,
      ),
    ]).animate(controller);

    moveAnim = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: Offset.zero, end: Offset.zero),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Offset.zero, end: const Offset(-0.1, 0)),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    nameOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.70, 0.95, curve: Curves.easeIn),
      ),
    );

    nameSlide = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.70, 0.95, curve: Curves.easeOut),
      ),
    );

    start();
  }

  void start() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) setState(() => startAnimation = true);

    await controller.forward();
    await Future.delayed(const Duration(milliseconds: 800));

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: moveAnim,
                    child: Transform.scale(
                      scale: scaleAnim.value,
                      child: Image.asset(
                        "assets/logo/main.png",
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SlideTransition(
                    position: nameSlide,
                    child: FadeTransition(
                      opacity: nameOpacity,
                      child: Image.asset(
                        "assets/logo/main2.png",
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
              : const SizedBox(),
        ),
      ),
    );
  }
}