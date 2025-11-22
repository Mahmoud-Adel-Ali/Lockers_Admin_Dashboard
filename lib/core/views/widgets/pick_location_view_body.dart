import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/arrow_back_icon.dart';
import '../../widgets/custom_button.dart';

class PickLocationViewBody extends StatelessWidget {
  const PickLocationViewBody({super.key, this.isLoading, this.onTabNext});
  final bool? isLoading;
  final void Function()? onTabNext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16, width: double.infinity),
        if (!kIsWeb)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [ArrowBackIcon()]),
          ),
        const Spacer(),
        if (isLoading == true) Center(child: const CircularProgressIndicator()),
        if (isLoading == false) CustomButton(text: 'حفظ', onPressed: onTabNext),
        SizedBox(height: 16),
      ],
    );
  }
}
