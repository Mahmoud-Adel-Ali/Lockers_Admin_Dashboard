import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../widgets/arrow_back_icon.dart';
import '../widgets/custom_button.dart';
import 'widgets/pick_location_bottom_sheet.dart';

class PickLocationView extends StatelessWidget {
  const PickLocationView({super.key});
  static const routeName = 'PickCompanyLocation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesTestMapImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [ArrowBackIcon()]),
              ),
              const Spacer(),
              CustomButton(
                text: 'حفظ',
                onPressed: () => pickLocationBottomSheet(context),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
