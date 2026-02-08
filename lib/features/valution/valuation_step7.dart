import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../dashboard/dashboard_screen.dart';

class ValuationStep7 extends StatefulWidget {
  const ValuationStep7({super.key});

  @override
  State<ValuationStep7> createState() => _ValuationStep7State();
}

class _ValuationStep7State extends State<ValuationStep7> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text("Valuation Report"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined, color: Colors.black),
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFEDE7DF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Step 7/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Declaration & Submission",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Terms and Conditions",
                      style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      "By submitting this form, you agree to the following terms:\n"
                          "इस फॉर्म को सबमिट करके, आप निम्नलिखित नियमों और शर्तों से सहमत होते हैं:\n\n"
                          "1. Accuracy of Information / जानकारी की सटीकता:\n"
                          "2. You confirm that all the details filled regarding the property visit are true and accurate.\n"
                          "3. आप पुष्टि करते हैं कि संपत्ति दौरे से संबंधित सभी जानकारी सत्य और सटीक है।\n\n"
                          "4. Confidentiality / गोपनीयता:\n"
                          "5. You agree to maintain the confidentiality of any information, images, or documents collected during the site visit.\n"
                          "6. आप सहमत हैं कि दौरे के दौरान एकत्रित कोई भी जानकारी, चित्र या दस्तावेज़ गोपनीय रखे जाएंगे।\n\n"
                          "7. Compliance with Company Policy / कंपनी नीति का पालन:\n"
                          "8. You confirm that you have followed all company policies, safety rules, and ethical standards during the site visit.\n"
                          "9. आप पुष्टि करते हैं कि आपने साइट विजिट के दौरान कंपनी की सभी नीतियों, सुरक्षा नियमों और नैतिक मानकों का पालन किया है।\n\n"
                          "10. Responsibility / ज़िम्मेदारी:\n"
                          "11. You accept responsibility for the correctness of the submitted information. False or misleading entries may lead to action as per company policy.\n"
                          "12. आप प्रस्तुत की गई जानकारी की सही होने की ज़िम्मेदारी स्वीकार करते हैं।\n\n"
                          "13. Use of Collected Data / एकत्रित डेटा का उपयोग:\n"
                          "14. The submitted data may be used for reporting, evaluation, client updates, and internal operations.\n\n"
                          "15. Photographic Evidence / फोटो साक्ष्य:\n"
                          "16. If photographs are submitted, they must be original and taken during the site visit.\n\n"
                          "17. Acknowledgment / स्वीकृति:\n"
                          "18. You acknowledge that you have read, understood, and agreed to all the terms above.",
                      style: TextStyle(fontSize: 13, height: 1.5),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: agree,
                        onChanged: (v) => setState(() => agree = v!),
                        activeColor: Colors.orange,
                      ),
                      const Expanded(
                        child: Text(
                          "I hereby declare that the information provided above is accurate and I agree to the Terms and Conditions mentioned.\n\n"
                              "मैं घोषणा करता/करती हूँ कि उपरोक्त दी गई जानकारी सत्य है और मैं उल्लिखित नियमों और शर्तों से सहमत हूँ।",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        color: AppColors.background,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: agree
                    ? () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Dashboard()),
                        (route) => false,
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFF3E0),
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "Submit Report",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
