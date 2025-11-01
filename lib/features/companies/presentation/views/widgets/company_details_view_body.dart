import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import 'company_basic_info_section.dart';
import 'company_subscribtion_section.dart';

class CompanyDetailsViewBody extends StatelessWidget {
  const CompanyDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizeConfig.isDesktop()
        ? Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(child: CompanyBasicInfoSection()),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: CompanySubscribtionSection(),
                ),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              spacing: 12,
              children: [
                CompanyBasicInfoSection(),
                CompanySubscribtionSection(),
              ],
            ),
          );
  }
}
