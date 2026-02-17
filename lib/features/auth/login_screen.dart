import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: const Color(0xFFFFF8E9),
      body: Stack(
        children: [
          /// FIGMA BACKGROUND DESIGN (bg.png)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
              width: size.width,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),

                /// LOGO SECTION (main.png & main2.png side by side)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/main.png',
                      height: 55,
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/logo/main2.png',
                      height: 55,
                    ),
                  ],
                ),

                const Spacer(),

                /// LOGIN BOTTOM CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
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
                          "Please enter your Mobile Number and password to continue.",
                          style: AppTextStyles.subText,
                        ),
                        const SizedBox(height: 30),

                        /// Mobile Field Logic
                        AppTextField(
                          hint: "Enter Mobile Number",
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          inputFormatters: [
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

                        /// PIN Field Logic
                        AppTextField(
                          hint: "Enter 4 digit PIN",
                          controller: pinController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          obscureText: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (_) => setState(() {}),
                        ),

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
                            child: Text(
                              "Forgot Pin?",
                              style: TextStyle(
                                color: const Color(0xFF6B6B6B),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// LOGIN BUTTON Logic
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

                        /// REGISTER Logic
                        Center(
                          child: Wrap(
                            children: [
                              const Text("Don’t have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Color(0xFFF3AD44),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}