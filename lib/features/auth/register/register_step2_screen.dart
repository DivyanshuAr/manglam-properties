import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import 'register_step3_screen.dart';

class RegisterStep2Screen extends StatefulWidget {
  const RegisterStep2Screen({super.key});

  @override
  State<RegisterStep2Screen> createState() => _RegisterStep2ScreenState();
}

class _RegisterStep2ScreenState extends State<RegisterStep2Screen> {
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController holderController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController uanController = TextEditingController();
  final TextEditingController esicController = TextEditingController();

  TextStyle labelStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B6B6B),
  );

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF9A9A9A),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
      ),
    );
  }

  @override
  void dispose() {
    aadhaarController.dispose();
    panController.dispose();
    holderController.dispose();
    bankController.dispose();
    accountController.dispose();
    ifscController.dispose();
    uanController.dispose();
    esicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Please enter following details to Register",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(12),
                        border:
                        Border.all(color: const Color(0xFFE5E5E5)),
                      ),
                      child: const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Step Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "2/5",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Government & Banking Details",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),

                          Text("Aadhaar Number", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: aadhaarController,
                            keyboardType: TextInputType.number,
                            inputFormatters:  [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration:
                            inputDecoration("Enter Aadhar Number"),
                          ),

                          const SizedBox(height: 16),
                          Text("PAN Number", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: panController,
                            decoration:
                            inputDecoration("Enter PAN Number"),
                          ),

                          const SizedBox(height: 16),
                          Text("Bank Account Holder Name",
                              style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: holderController,
                            decoration: inputDecoration(
                                "Enter Bank Account Holder Name"),
                          ),

                          const SizedBox(height: 16),
                          Text("Bank Name", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: bankController,
                            decoration:
                            inputDecoration("Enter Bank Name"),
                          ),

                          const SizedBox(height: 16),
                          Text("Account Number", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: accountController,
                            keyboardType: TextInputType.number,
                            inputFormatters:  [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration:
                            inputDecoration("Enter Account Number"),
                          ),

                          const SizedBox(height: 16),
                          Text("IFSC Code", style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: ifscController,
                            decoration:
                            inputDecoration("Enter IFSC Code"),
                          ),

                          const SizedBox(height: 16),
                          Text("UAN Number (if applicable)",
                              style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: uanController,
                            decoration:
                            inputDecoration("Enter UAN Number"),
                          ),

                          const SizedBox(height: 16),
                          Text("ESIC Number (if applicable)",
                              style: labelStyle),
                          const SizedBox(height: 8),
                          TextField(
                            controller: esicController,
                            decoration:
                            inputDecoration("Enter ESIC Number"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              color: AppColors.background,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6EEDC),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => Navigator.pop(context),
                        child: const Center(
                          child: Text(
                            "← Previous",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6EEDC),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const RegisterStep3Screen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Next →",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
