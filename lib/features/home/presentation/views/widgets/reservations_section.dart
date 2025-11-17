import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../manager/home_provider.dart';
import 'reservations_chart.dart';
import 'section_header_list_tile.dart';

class ReservationsSection extends StatelessWidget {
  const ReservationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();
    return Container(
      width: double.infinity,
      height: 333,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.filedGrey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Skeletonizer(
        enabled: prov.checkGetHomeDashboardData == null,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SectionHeaderListTile(
                    title: 'الحجوزات',
                    svgIcon: Assets.imagesReservationsIcon,
                  ),
                ),
                Expanded(
                  child: Text(
                    prov.total > 0 ? '${prov.total} حجز' : '',
                    style: AppTextStyles.style16w700(
                      context,
                    ).copyWith(color: AppColors.grey),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Text(
                    prov.year.toString(),
                    style: AppTextStyles.style20w700(context),
                  ),
                ),
              ],
            ),
            //body
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // If width < 600 → enable horizontal scroll
                  if (constraints.maxWidth < 600) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 600, // minimum width for chart to look good
                        child: ReservationsChart(),
                      ),
                    );
                  }

                  // Otherwise → show normally
                  return ReservationsChart();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
