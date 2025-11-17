import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

final List<double> monthlyValues = [
  0.5,
  0.75,
  1.0,
  0.75,
  0.5,
  0.25,
  0.5,
  0.75,
  0.75,
  0.5,
  0.75,
  0.75,
];

final List<String> completedOrders = [
  '17',
  '3',
  '6',
  '1',
  '0',
  '12',
  '11',
  '50',
  '10',
  '39',
  '47',
  '90',
];

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

class SalesChart extends StatelessWidget {
  const SalesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5,
      child: SizedBox(
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
                            label = '100 حجز';
                          } else if (value == 0.5) {
                            label = '200 حجز';
                          } else if (value == 0.75) {
                            label = '300 حجز';
                          } else if (value == 1.0) {
                            label = '400 حجز';
                          } else if (value == 1.5) {
                            label = '500 حجز';
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
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) => Text(
                          months[value.toInt()],
                          style: AppTextStyles.style14w400(context),
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 0.25,
                    // verticalInterval: 0.025,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: AppColors.grey, strokeWidth: 1.5),
                    // getDrawingVerticalLine: (value) =>
                    //     FlLine(color: AppColors.gray, strokeWidth: 1),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(12, (i) {
                    final isHighlighted = i == 2; // March
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: monthlyValues[i],
                          width: 35,
                          color: isHighlighted
                              ? AppColors.main
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: completedOrders
                            .map(
                              (p) => FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  p,
                                  style: AppTextStyles.style14w400(context),
                                ),
                              ),
                            )
                            .toList(),
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
}
