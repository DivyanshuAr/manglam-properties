import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({super.key});

  @override
  State<ResetPinScreen> createState() => _ResetPinScreenState();
}

class _ResetPinScreenState extends State<ResetPinScreen> {
  final int pinLength = 4;

  late List<TextEditingController> _pinControllers;
  late List<TextEditingController> _confirmPinControllers;
  late List<FocusNode> _pinFocus;
  late List<FocusNode> _confirmPinFocus;

  @override
  void initState() {
    super.initState();
    _pinControllers =
        List.generate(pinLength, (_) => TextEditingController());
    _confirmPinControllers =
        List.generate(pinLength, (_) => TextEditingController());

    _pinFocus = List.generate(pinLength, (_) => FocusNode());
    _confirmPinFocus = List.generate(pinLength, (_) => FocusNode());
  }

  void _handleChange(String value, int index, List<FocusNode> focusList) {
    if (value.isNotEmpty && index < pinLength - 1) {
      focusList[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusList[index - 1].requestFocus();
    }
  }

  String _getPin(List<TextEditingController> list) =>
      list.map((e) => e.text).join();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Stack(
        children: [
          /// 🔹 CENTER IMAGE
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.12),
              child: Image.asset(
                "assets/login.png", // same image as figma
                height: size.height * 0.28,
                fit: BoxFit.contain,
              ),
            ),
          ),

          ///  BOTTOM CONTAINER
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reset Login Pin",
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Enter New Pin",
                    style: AppTextStyles.subText,
                  ),

                  const SizedBox(height: 20),
                  const Text("Login Pin"),
                  const SizedBox(height: 10),
                  _pinRow(_pinControllers, _pinFocus),

                  const SizedBox(height: 22),
                  const Text("Confirm Login Pin"),
                  const SizedBox(height: 10),
                  _pinRow(_confirmPinControllers, _confirmPinFocus),

                  const SizedBox(height: 28),

                  AppButton(
                    title: "Verify Number",
                    onTap: () {
                      final pin = _getPin(_pinControllers);
                      final confirmPin = _getPin(_confirmPinControllers);

                      if (pin.length != pinLength ||
                          confirmPin.length != pinLength) {
                        _showError("Enter complete PIN");
                        return;
                      }

                      if (pin != confirmPin) {
                        _showError("PIN does not match");
                        return;
                      }

                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///  PIN INPUT ROW
  Widget _pinRow(
      List<TextEditingController> controllers,
      List<FocusNode> focusNodes,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        pinLength,
            (index) => SizedBox(
          width: 60,
          height: 52,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 1,
            textAlign: TextAlign.center,
            obscureText: false,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.primary),
              ),
            ),
            onChanged: (value) =>
                _handleChange(value, index, focusNodes),
          ),
        ),
      ),
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
