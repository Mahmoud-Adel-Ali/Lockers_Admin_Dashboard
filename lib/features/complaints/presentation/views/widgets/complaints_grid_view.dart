import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_user_card.dart';
import '../../manager/complaints_provider.dart';
import 'show_comlaints_data_dialog.dart';

class ComplaintsGridView extends StatelessWidget {
  const ComplaintsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ComplaintsProvider>();
    List complaints = prov.filteredComplaints;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Skeletonizer(
          enabled: prov.checkGettingAllComplaints == null,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //* meaning that the minwidth of the card is 160.
              crossAxisCount: (width / 160).toInt(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 198.5 / 250,
              mainAxisExtent: 190,
            ),
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              // var complaint = complaints[index];
              return CustomUserCard(
                name: 'John Doe ${index + 2}',
                phone: '1234567890',
                assetsImage: Assets.imagesTestUserImage,
                onTap: () => showComplaintDataDialog(context),
              );
            },
          ),
        );
      },
    );
  }
}
