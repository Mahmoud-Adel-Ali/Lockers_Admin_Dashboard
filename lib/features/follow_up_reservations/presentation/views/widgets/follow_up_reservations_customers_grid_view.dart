import 'package:flutter/widgets.dart';

import 'follow_up_reservation_customer_card.dart';

class FollowUpReservationCustomersGridView extends StatelessWidget {
  const FollowUpReservationCustomersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //* meaning that the minwidth of the card is 210.
            crossAxisCount: (width / 210).toInt(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 200 / 280,
            mainAxisExtent: 240,
          ),
          itemCount: 17,
          itemBuilder: (context, index) {
            return const FollowUpReservationCustomerCard();
          },
        );
      },
    );
  }
}
