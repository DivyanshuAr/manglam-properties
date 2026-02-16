import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manglam_engineers/features/auth/forgot_pin_screen.dart';
import 'package:manglam_engineers/features/auth/register/register_step1_screen.dart';
import 'package:manglam_engineers/features/dashboard/dashboard_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  bool get isFormFilled =>
      mobileController.text.length == 10 && pinController.text.length == 4;

  @override
  void dispose() {
    mobileController.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      /// ================= FIGMA STYLE TOP =================
                      SizedBox(
                        height: size.height * .42,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// cream base
                            Container(color: const Color(0xFFF6E7C1)),

                            /// house background
                            Positioned.fill(
                              child: Opacity(
                                opacity: .35,
                                child: Image.asset(
                                  "assets/bg.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            /// logo
                            Image.asset(
                              "assets/logo/logo.png",
                              height: 60,
                            ),
                          ],
                        ),
                      ),

                      /// ================= BOTTOM CARD =================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Login", style: AppTextStyles.heading),
                              const SizedBox(height: 8),
                              Text(
                                "Please enter your Mobile Number and PIN to continue.",
                                style: AppTextStyles.subText,
                              ),
                              const SizedBox(height: 30),

                              /// Mobile
                              AppTextField(
                                hint: "Enter Mobile Number",
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters:  [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Mobile number required";
                                  }
                                  if (value.length != 10) {
                                    return "Enter valid 10 digit number";
                                  }
                                  return null;
                                },
                                onChanged: (_) => setState(() {}),
                              ),

                              const SizedBox(height: 16),

                              /// PIN
                              AppTextField(
                                hint: "Enter 4 digit PIN",
                                controller: pinController,
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                obscureText: true,
                                inputFormatters:  [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (_) => setState(() {}),
                              ),

                              const SizedBox(height: 8),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                        const ForgotPinScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Pin?",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              /// LOGIN BUTTON
                              AppButton(
                                title: "Login",
                                isEnabled: isFormFilled,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const Dashboard(),
                                      ),
                                    );
                                  }
                                },
                              ),

                              const SizedBox(height: 24),

                              /// REGISTER
                              Center(
                                child: Wrap(
                                  children: [
                                    const Text("Don’t have an account? "),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                            const RegisterScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                          color: AppColors.accent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).padding.bottom,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
