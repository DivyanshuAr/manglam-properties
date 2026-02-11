import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';
import 'otp_screen.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
              SizedBox(width: 8),
              Text(
                "Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              bottom: 20,
                              child: Container(
                                height: size.height * 0.24,
                                width: size.height * 0.24,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE8E1DA),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/login.svg",
                              height: size.height * 0.30,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Forgot Pin", style: AppTextStyles.heading),
                              const SizedBox(height: 8),
                              Text(
                                "Verify your Mobile Number to set new Pin",
                                style: AppTextStyles.subText,
                              ),
                              const SizedBox(height: 30),
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
                              const SizedBox(height: 32),
                              AppButton(
                                title: "Send OTP",
                                isEnabled: mobileController.text.length == 10,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OtpScreen(
                                          mobile: mobileController.text,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: MediaQuery.of(context).padding.bottom),
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