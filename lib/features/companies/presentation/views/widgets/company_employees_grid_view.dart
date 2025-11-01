import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_user_card.dart';

class CompanyEmployeesGridView extends StatelessWidget {
  const CompanyEmployeesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //* meaning that the minwidth of the card is 160.
            crossAxisCount: (width / 160).toInt(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 198.5 / 250,
            mainAxisExtent: 190,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return CustomUserCard(
              name: 'John Doe ${index + 1}',
              phone: '1234567890',
              assetsImage: Assets.imagesTestUserImage,
            );
          },
        );
      },
    );
  }
}
