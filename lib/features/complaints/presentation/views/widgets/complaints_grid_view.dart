import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_user_card.dart';
import '../../../data/models/complaint_model.dart';
import '../../manager/complaints_provider.dart';
import 'show_comlaints_data_dialog.dart';

class ComplaintsGridView extends StatelessWidget {
  const ComplaintsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ComplaintsProvider>();
    List<ComplaintModel> complaints = prov.filteredComplaints;
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
              ComplaintModel complaint = complaints[index];
              return CustomUserCard(
                // (complaint.reply == null ? '🟢 ' : '') +
                name: complaint.name,
                phone: complaint.phone,
                imgUrl: complaint.image,
                onTap: () =>
                    showComplaintDataDialog(context, complaint: complaint),
              );
            },
          ),
        );
      },
    );
  }
}
