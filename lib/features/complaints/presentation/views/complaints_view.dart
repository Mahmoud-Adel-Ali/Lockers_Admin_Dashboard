import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/api_error_widget.dart';
import '../../../../core/widgets/empty_grid_view_widget.dart';
import '../manager/complaints_provider.dart';
import 'widgets/complaints_grid_view.dart';
import 'widgets/complaints_view_header.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ComplaintsProvider>();
    List complaints = prov.filteredComplaints;
    return Scaffold(
      body: prov.checkGettingAllComplaints == false
          ? ApiErrorView(msg: prov.message, onRetry: prov.getAllComplaints)
          : Column(
              children: [
                const SizedBox(height: 8),
                const ComplaintsViewHeader(),
                const SizedBox(height: 8),
                if (complaints.isEmpty)
                  EmptyGridViewWidget(msg: 'لا يوجد شكاوي.')
                else
                  Expanded(child: ComplaintsGridView()),
                const SizedBox(height: 8),
              ],
            ),
    );
  }
}
