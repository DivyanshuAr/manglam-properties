import 'package:flutter/material.dart';
import 'package:manglam_engineers/features/valution/valuation_step4.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_textfield.dart';
import '../../core/widgets/bottom_action_buttons.dart';

class ValuationStep3 extends StatefulWidget {
  const ValuationStep3({super.key});

  @override
  State<ValuationStep3> createState() => _ValuationStep3State();
}

class _ValuationStep3State extends State<ValuationStep3> {
  final _formKey = GlobalKey<FormState>();

  final ageController = TextEditingController();
  final heightController1 = TextEditingController();
  final heightController2 = TextEditingController();
  final vacantController = TextEditingController();
  final mixUseController = TextEditingController();
  final landDocController = TextEditingController();
  final landActualController = TextEditingController();

  bool east = false, west = false, north = false, south = false, none = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Valuation Report",
          style: AppTextStyles.appBarTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined, color: Colors.black87),
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFF1ECE6),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Step 3/7",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text("Land & Building Details",
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label("Age of Property (in years)"),
                    AppTextField(
                      hint: "Enter property age",
                      controller: ageController,
                      keyboardType: TextInputType.number,
                    ),
                    _helper("For Months e.g 6 months = 0.6 years"),

                    _label("Condition of Approach Road"),
                    _dropdown("Select road condition"),

                    _label("Height of Building"),
                    _heightRow(heightController1, true),
                    _heightRow(heightController2, false),

                    _label("Plot Demarcation"),
                    Wrap(
                      spacing: 16,
                      children: [
                        _check("East Side", east, (v) => setState(() => east = v)),
                        _check("West Side", west, (v) => setState(() => west = v)),
                        _check("North Side", north, (v) => setState(() => north = v)),
                        _check("South Side", south, (v) => setState(() => south = v)),
                        _check("None", none, (v) => setState(() => none = v)),
                      ],
                    ),

                    _section("Floor Wise Details"),
                    _dropdown("Floor"),
                    _dropdown("Occupancy Details"),
                    _dropdown("Type of Structure"),
                    _dropdown("Use of Property"),

                    _label("If Vacant How Long & If Rented (Tenant Names with Rent per month)"),
                    AppTextField(
                      hint: "Enter details",
                      controller: vacantController,
                      maxLines: 3,
                    ),
                    _helper("For Months e.g 6 months = 0.6 years"),

                    _label("If Use of Property is Mix, Mention Floor with use of property"),
                    AppTextField(
                      hint: "Enter details",
                      controller: mixUseController,
                      maxLines: 3,
                    ),

                    _label("Surrounding Boundaries (4 Corners)"),
                    _boundary("East"),
                    _boundary("West"),
                    _boundary("North"),
                    _boundary("South"),

                    _section("Land Area Details"),
                    AppTextField(
                      hint: "According to Documents",
                      controller: landDocController,
                    ),
                    AppTextField(
                      hint: "Actual",
                      controller: landActualController,
                    ),

                    _section("Construction Details"),
                    _dropdown("Floor"),
                    AppTextField(
                      hint: "as per actual",
                      controller: TextEditingController(),
                    ),
                    AppTextField(
                      hint: "as per set back norms",
                      controller: TextEditingController(),
                    ),

                    _section("Specifications"),
                    _dropdown("Floor"),
                    AppTextField(hint: "Room", controller: TextEditingController()),
                    AppTextField(hint: "Kitchen", controller: TextEditingController()),
                    AppTextField(hint: "Hall", controller: TextEditingController()),
                    AppTextField(hint: "Bathroom", controller: TextEditingController()),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomActionButtons(
        onPrevious: () => Navigator.pop(context),
        onNext: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ValuationStep4()),
          );
        },
      ),
    );
  }

  Widget _label(String t) => Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 6),
    child: Text(t, style: AppTextStyles.label),
  );

  Widget _section(String t) => Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 10),
    child: Text(t, style: AppTextStyles.sectionTitle),
  );

  Widget _helper(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(t, style: const TextStyle(fontSize: 12, color: Colors.grey)),
  );

  Widget _dropdown(String hint) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE0E0E0)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hint, style: const TextStyle(color: Colors.grey)),
        const Icon(Icons.keyboard_arrow_down),
      ],
    ),
  );

  Widget _heightRow(TextEditingController c, bool add) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Expanded(child: _dropdown("Select Floor")),
        const SizedBox(width: 10),
        Expanded(
          child: AppTextField(
            hint: "Enter Height",
            controller: c,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(add ? Icons.add : Icons.delete, color: Colors.grey),
        ),
      ],
    ),
  );

  Widget _check(String t, bool v, Function(bool) fn) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Checkbox(value: v, onChanged: (val) => fn(val!)),
      Text(t),
    ],
  );

  Widget _boundary(String side) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        SizedBox(width: 60, child: Text(side)),
        Expanded(
            child: AppTextField(
                hint: "Actual", controller: TextEditingController())),
        const SizedBox(width: 10),
        Expanded(
            child: AppTextField(
                hint: "Actual", controller: TextEditingController())),
      ],
    ),
  );
}
