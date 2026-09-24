import 'package:ironlink/features/fatigue/domain/entities/training_load_point.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FatigueChart extends StatelessWidget {
  const FatigueChart({super.key, required this.data});
  final List<TrainingLoadPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No fatigue data available.'));
    }

    // Map the domain data to fl_chart data structures
    final barGroups = <BarChartGroupData>[];
    final acwrSpots = <FlSpot>[];
    final dates = <String>[];

    for (int i = 0; i < data.length; i++) {
      final point = data[i];
      dates.add('${point.date.month}/${point.date.day}');

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: point.dailyLoad,
              color: Colors.blueAccent.withValues(alpha: 0.7),
              width: 16,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );

      // ACWR is often a small ratio (0.5 to 2.0).
      // We scale it for visual overlay, or use a secondary axis.
      // For simplicity, we plot it scaled by a factor if dailyLoad is large,
      // but fl_chart allows line charts to be overlaid. We will just plot the raw ACWR value.
      acwrSpots.add(FlSpot(i.toDouble(), point.acwr));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Daily Training Load & ACWR',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: barGroups,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < dates.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dates[index],
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 32,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'ACWR Trend (Risk Threshold: > 1.5)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: acwrSpots,
                    isCurved: true,
                    color: Colors.redAccent,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                  ),
                ],
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 1.5,
                      color: Colors.red.withValues(alpha: 0.5),
                      strokeWidth: 2,
                      dashArray: [5, 5],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 8, bottom: 4),
                        style: const TextStyle(color: Colors.red, fontSize: 10),
                        labelResolver: (line) => 'Danger Zone',
                      ),
                    ),
                  ],
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < dates.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              dates[index],
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                minY: 0,
                maxY: 3, // ACWR rarely exceeds 3
              ),
            ),
          ),
        ],
      ),
    );
  }
}
