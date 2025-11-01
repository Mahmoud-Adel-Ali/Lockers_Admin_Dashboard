import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/arrow_back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import 'widgets/pick_company_location_bottom_sheet.dart';

class PickCompanyLocationView extends StatelessWidget {
  const PickCompanyLocationView({super.key});
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
                onPressed: () => pickCompanyLocationBottomSheet(context),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
