import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    pinController.dispose();
    emailController.dispose();
    confirmEmailController.dispose();
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
                                height: size.height * 0.22,
                                width: size.height * 0.22,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE8E1DA),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/login.svg",
                              height: size.height * 0.26,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Create Account", style: AppTextStyles.heading),
                              const SizedBox(height: 25),
                              AppTextField(
                                hint: "Full Name",
                                controller: nameController,
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                hint: "Mobile Number",
                                controller: mobileController,
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                hint: "Create 4 digit Pin",
                                controller: pinController,
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                obscureText: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                hint: "Email",
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                hint: "Confirm Email",
                                controller: confirmEmailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 30),
                              AppButton(
                                title: "Register",
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).padding.bottom),
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