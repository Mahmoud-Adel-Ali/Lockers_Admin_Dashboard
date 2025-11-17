import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/customers_provider.dart';
import 'customer_card.dart';
import 'pagination_controls.dart';

class CustomersGridView extends StatelessWidget {
  const CustomersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CustomersProvider>();
    var customers = prov.customers;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Stack(
          children: [
            Skeletonizer(
              enabled: prov.checkGetAllCustomers == null,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //* meaning that the minwidth of the card is 160.
                  crossAxisCount: (width / 160).toInt(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 198.5 / 250,
                  mainAxisExtent: 222,
                ),
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  return CustomerCard(customer: customers[index]);
                },
              ),
            ),
            PaginationControls(
              hasNext: prov.currentPage < prov.lastPage,
              hasPrevious: prov.currentPage > 1,
              onNext: () {
                if (prov.checkGetAllCustomers == null) return;
                prov.nextPage();
              },
              onPrevious: () {
                if (prov.checkGetAllCustomers == null) return;
                prov.previousPage();
              },
            ),
          ],
        );
      },
    );
  }
}
