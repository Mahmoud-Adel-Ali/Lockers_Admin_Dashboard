import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/empty_grid_view_widget.dart';
import '../../manager/reservations_provider.dart';
import 'reservation_customer_card.dart';

class ReservationCustomersGridView extends StatelessWidget {
  const ReservationCustomersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ReservationsProvider>();
    var orders = prov.filterdUnitOrders;
    return orders.isEmpty && prov.checkGettingUnitDetails == true
        ? const EmptyGridViewWidget(msg: 'لا يوجد عملاء بعد')
        : LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              return Skeletonizer(
                enabled: prov.checkGettingUnitDetails == null,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //* meaning that the minwidth of the card is 180.
                    crossAxisCount: (width / 180).toInt(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 200 / 300,
                    mainAxisExtent: 280,
                  ),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return ReservationCustomerCard(order: orders[index]);
                  },
                ),
              );
            },
          );
  }
}
