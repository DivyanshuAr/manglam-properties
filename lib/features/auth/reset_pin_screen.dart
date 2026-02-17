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
    _pinControllers = List.generate(pinLength, (_) => TextEditingController());
    _confirmPinControllers = List.generate(pinLength, (_) => TextEditingController());
    _pinFocus = List.generate(pinLength, (_) => FocusNode());
    _confirmPinFocus = List.generate(pinLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _pinControllers) c.dispose();
    for (var c in _confirmPinControllers) c.dispose();
    for (var f in _pinFocus) f.dispose();
    for (var f in _confirmPinFocus) f.dispose();
    super.dispose();
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
      backgroundColor: const Color(0xFFFFF8E9),
      body: Stack(
        children: [
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg.png',
              height: size.height * 0.42,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo/main.png', height: 55),
                    const SizedBox(width: 12),
                    Image.asset('assets/logo/main2.png', height: 55),
                  ],
                ),
                const Spacer(),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reset Login Pin", style: AppTextStyles.heading),
                      const SizedBox(height: 6),
                      Text("Enter New Pin", style: AppTextStyles.subText),
                      const SizedBox(height: 25),
                      const Text("Login Pin",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      _pinRow(_pinControllers, _pinFocus),
                      const SizedBox(height: 22),
                      const Text("Confirm Login Pin",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 10),
                      _pinRow(_confirmPinControllers, _confirmPinFocus),
                      const SizedBox(height: 32),
                      AppButton(
                        title: "Update PIN",
                        isEnabled: _getPin(_pinControllers).length == pinLength &&
                            _getPin(_confirmPinControllers).length == pinLength,
                        onTap: () {
                          final pin = _getPin(_pinControllers);
                          final confirmPin = _getPin(_confirmPinControllers);

                          if (pin != confirmPin) {
                            _showError("PIN does not match");
                            return;
                          }

                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.orange),
              ),
            ),
            onChanged: (value) => _handleChange(value, index, focusNodes),
          ),
        ),
      ),
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}