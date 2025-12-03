import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/home_dashboard_response.dart';
import '../../manager/home_provider.dart';

// final List<double> monthlyValues = [
//   0.5,
//   0.75,
//   1.0,
//   0.75,
//   0.5,
//   0.25,
//   0.5,
//   0.75,
//   0.75,
//   0.5,
//   0.75,
//   0.75,
// ];

// final List<String> completedOrders = [
//   '17',
//   '3',
//   '6',
//   '1',
//   '0',
//   '12',
//   '11',
//   '50',
//   '10',
//   '39',
//   '47',
//   '90',
// ];

final List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

class ReservationsChart extends StatelessWidget {
  const ReservationsChart({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();
    List<MonthlyOrders> monthly = prov.monthly;
    int maxVal = prov.maxVal;
    return AspectRatio(
      aspectRatio: 5,
      child: Skeletonizer(
        enabled: prov.checkGetHomeDashboardData == null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 1.5,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        interval: 0.25,
                        getTitlesWidget: (value, _) {
                          String label;
                          if (value == 0) {
                            label = '0 حجز';
                          } else if (value == 0.25) {
                            label =
                                '${horizontalVal(maxVal: maxVal, index: 1)} حجز';
                          } else if (value == 0.5) {
                            label =
                                '${horizontalVal(maxVal: maxVal, index: 2)} حجز';
                          } else if (value == 0.75) {
                            label =
                                '${horizontalVal(maxVal: maxVal, index: 3)} حجز';
                          } else if (value == 1.0) {
                            label =
                                '${horizontalVal(maxVal: maxVal, index: 4)} حجز';
                          } else if (value == 1.25) {
                            label =
                                '${horizontalVal(maxVal: maxVal, index: 5)} حجز';
                          } else {
                            return const SizedBox.shrink();
                          }

                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.style12w400(context),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      drawBelowEverything: true,
                      axisNameSize: 22,
                      // sideTitleAlignment: SideTitleAlignment.outside,
                      axisNameWidget: const Text(
                        'الشهور',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sideTitles: SideTitles(
                        interval: 1,
                        reservedSize: 18,
                        showTitles: true,
                        getTitlesWidget: (value, _) => Text(
                          months[value.toInt()],
                          style: AppTextStyles.style14w400(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (s) => true,
                    checkToShowVerticalLine: (s) => true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 0.25,
                    verticalInterval: 0.025,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: AppColors.grey, strokeWidth: 1.5),
                    // getDrawingVerticalLine: (value) =>
                    //     FlLine(color: AppColors.main, strokeWidth: 1),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(monthly.length, (i) {
                    // x = monthly[i].orders
                    // y = maxVal
                    // finalVal = x / y + x * 0.05
                    //     =  x * (0.05 + 1 / y)
                    final isHighlighted = (i == DateTime.now().month - 1);
                    var val = monthly[i].orders;
                    var finalVal = val * (0.05 + 1 / maxVal);

                    log("$val / $maxVal = val[$i] : $finalVal");
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: finalVal,
                          width: 38,
                          color: isHighlighted
                              ? AppColors.blue
                              : AppColors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            Divider(color: AppColors.grey, height: 0),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: monthly
                              .map(
                                (p) => FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    p.orders.toString(),
                                    style: AppTextStyles.style14w400(context),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(width: 32),
                    Text(
                      'عدد\nالحجوزات\nالمكتملة',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int horizontalVal({required int maxVal, required int index}) =>
      (maxVal / 5).toInt() * index;
}
