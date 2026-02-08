import 'package:flutter/material.dart';
import 'package:manglam_engineers/features/auth/forgot_pin_screen.dart';
import 'package:manglam_engineers/features/auth/register_screen.dart';
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
      mobileController.text.length == 10 &&
          pinController.text.length == 4;

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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /// Illustration
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/login.png",
                    height: size.height * 0.30,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// Bottom Card
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.32),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text("Login", style: AppTextStyles.heading),
                        const SizedBox(height: 6),
                        Text(
                          "Please enter your Mobile Number and PIN to continue.",
                          style: AppTextStyles.subText,
                        ),
                        const SizedBox(height: 22),

                        /// Mobile Number
                        AppTextField(
                          hint: "Enter Mobile Number",
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
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

                        const SizedBox(height: 14),

                        /// PIN
                        AppTextField(
                          hint: "Enter 4 digit PIN",
                          controller: pinController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          obscureText: true,
                          onChanged: (_) => setState(() {}),
                        ),

                        const SizedBox(height: 4),

                        /// Forgot PIN
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ForgotPinScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot Pin?",
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// Login Button
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

                        const SizedBox(height: 22),

                        /// Register
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
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
