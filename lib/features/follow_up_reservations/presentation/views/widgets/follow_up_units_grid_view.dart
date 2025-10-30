import 'package:flutter/widgets.dart';

import 'follow_up_unit_card.dart';

class FollowUpUnitsGridView extends StatelessWidget {
  const FollowUpUnitsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //* meaning that the minwidth of the card is 150.
            crossAxisCount: (width / 150).toInt(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
            mainAxisExtent: 150,
          ),
          itemCount: 17,
          itemBuilder: (context, index) {
            return const FollowUpUnitCard();
          },
        );
      },
    );
  }
}
