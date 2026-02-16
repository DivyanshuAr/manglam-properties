import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../login_screen.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final List<TextEditingController> pin =
  List.generate(4, (_) => TextEditingController());
  final List<TextEditingController> confirm =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> pinFocus = List.generate(4, (_) => FocusNode());
  final List<FocusNode> confirmFocus = List.generate(4, (_) => FocusNode());

  bool get valid {
    final p = pin.map((e) => e.text).join();
    final c = confirm.map((e) => e.text).join();
    return p.length == 4 && c.length == 4 && p == c;
  }

  Widget box({
    required TextEditingController controller,
    required FocusNode node,
    required int index,
    required bool isConfirm,
  }) {
    final focusList = isConfirm ? confirmFocus : pinFocus;

    return SizedBox(
      width: 60,
      height: 56,
      child: TextField(
        controller: controller,
        focusNode: node,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters:  [FilteringTextInputFormatter.digitsOnly],
        onChanged: (v) {
          if (v.isNotEmpty) {
            if (index < focusList.length - 1) {
              focusList[index + 1].requestFocus();
            } else {
              node.unfocus();
            }
          } else if (index > 0) {
            focusList[index - 1].requestFocus();
          }
          setState(() {});
        },
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var c in pin) c.dispose();
    for (var c in confirm) c.dispose();
    for (var f in pinFocus) f.dispose();
    for (var f in confirmFocus) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: height * .48,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(color: const Color(0xFFF6E7C1)),
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.25,
                      child: Image.asset(
                        "assets/bg.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/logo/logo.png",
                    height: 60,
                  ),
                ],
              ),
            ),

            Positioned(
              top: height * .40,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Set Login Pin",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Create a 4-digit MPIN to securely access your account.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      const SizedBox(height: 22),

                      const Text(
                        "Enter Pin",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4B164C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                              (i) => box(
                            controller: pin[i],
                            node: pinFocus[i],
                            index: i,
                            isConfirm: false,
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "Confirm Pin",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4B164C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                              (i) => box(
                            controller: confirm[i],
                            node: confirmFocus[i],
                            index: i,
                            isConfirm: true,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: valid
                              ? () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                                  (route) => false,
                            );
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: valid
                                ? AppColors.accent
                                : Colors.grey.shade300,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    );
  }
}
