import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/widgets/custom_search_field.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../manager/complaints_provider.dart';
import 'complaints_selector_filed.dart';

class ComplaintsViewHeader extends StatelessWidget {
  const ComplaintsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    bool isMobile = SizeConfig.isMobile();
    return Row(
      children: [
        Expanded(child: ComplaintsSearchField()),
        if (!isMobile) const Spacer(flex: 2) else SizedBox(width: 16),
        ComplaintsSelectorFiled(),
      ],
    );
  }
}

class ComplaintsSearchField extends StatelessWidget {
  const ComplaintsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<ComplaintsProvider>();
    return CustomSearchField(
      controller: prov.searchController,
      onChanged: (val) {
        if (prov.checkGettingAllComplaints != null || val.isEmpty) {
          prov.getAllComplaints();
        }
      },
    );
  }
}
