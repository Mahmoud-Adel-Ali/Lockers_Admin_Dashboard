import 'package:flutter/material.dart';

import 'locker_card.dart';

class LockersGridView extends StatelessWidget {
  const LockersGridView({super.key});

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
            childAspectRatio: 194 / 164,
            mainAxisExtent: 150,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return LockerCard();
          },
        );
      },
    );
  }
}
