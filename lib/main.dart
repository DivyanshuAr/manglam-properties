import 'package:flutter/material.dart';
import 'features/auth/login_screen.dart';

void main() {
  runApp(const ManglamApp());
}

class ManglamApp extends StatelessWidget {
  const ManglamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manglam Engineers',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const LoginScreen(),
    );
  }
}
