import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    for (var c in _pinControllers) {
      c.dispose();
    }
    for (var c in _confirmPinControllers) {
      c.dispose();
    }
    for (var f in _pinFocus) {
      f.dispose();
    }
    for (var f in _confirmPinFocus) {
      f.dispose();
    }
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                            SizedBox(height: MediaQuery.of(context).padding.bottom),
                          ],
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