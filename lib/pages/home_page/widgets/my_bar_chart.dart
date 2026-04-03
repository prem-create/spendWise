import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spend_wise/core/constants/app_spacing.dart';

class MyBarChart extends StatelessWidget {
  final List<double> yCoordinates;
  final List<double> xCoordinates;
  final double height;
  final double width;
  const MyBarChart({
    super.key,
    required this.yCoordinates,
    required this.xCoordinates,
    this.height = 200,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: yCoordinates.asMap().entries.map((entry) {
              final index = entry.key;
              final y = entry.value;
              return BarChartGroupData(
                x: xCoordinates[index].toInt(),
                barRods: [
                  BarChartRodData(
                    toY: y,
                    width: 40,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSpacing.curve),
                      topRight: Radius.circular(AppSpacing.curve),
                    ),
                  ),
                ],
              );
            }).toList(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 20,
                  reservedSize: 30,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 30),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
