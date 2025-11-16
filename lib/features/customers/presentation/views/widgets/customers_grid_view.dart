import 'package:flutter/material.dart';

import '../../../data/enums/customer_type.dart';
import 'customer_card.dart';
import 'pagination_controls.dart';

class CustomersGridView extends StatelessWidget {
  const CustomersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //* meaning that the minwidth of the card is 160.
                crossAxisCount: (width / 160).toInt(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 198.5 / 250,
                mainAxisExtent: 222,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return CustomerCard(
                  type: index % 2 == 0
                      ? CustomerType.system
                      : index % 3 == 0
                      ? CustomerType.newCustomers
                      : CustomerType.blocked,
                );
              },
            ),

            // PaginationControls(
            //   hasNext: currentPage < totalPages,
            //   hasPrevious: currentPage > 1,
            //   onNext: () => cubit.loadNextPage(),
            //   onPrevious: () => cubit.loadPreviousPage(),
            // ),
            PaginationControls(
              hasNext: true,
              hasPrevious: true,
              onNext: () {},
              onPrevious: () {},
            ),
          ],
        );
      },
    );
  }
}
