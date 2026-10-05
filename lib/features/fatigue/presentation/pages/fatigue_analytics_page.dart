import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class FatigueAnalyticsPage extends StatelessWidget {
  const FatigueAnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    final isFlagged = true; // Dummy risk flag

    return Scaffold(
      backgroundColor: colors.background, // NO card chrome! Tab IS content area
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Training Load (Last 4 Weeks)', style: textTheme.titleMedium),
                if (isFlagged) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: colors.effortHigh.withOpacity(0.1),
                      border: Border.all(color: colors.effortHigh, width: 1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'ACWR > 1.5',
                          style: AppTextStyles.dataStyle(colors, fontSize: 11, fontWeight: FontWeight.bold)
                              .copyWith(color: colors.effortHigh),
                        )
                      ],
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 240,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 120,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text('W${value.toInt()}', style: AppTextStyles.dataStyle(colors, fontSize: 10)),
                        ),
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(), 
                          style: AppTextStyles.dataStyle(colors, fontSize: 10).copyWith(color: colors.textSecondary)
                        ),
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(color: colors.surface2, strokeWidth: 1),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _buildBar(1, 40, colors),
                    _buildBar(2, 60, colors),
                    _buildBar(3, 85, colors, isHighEffort: true),
                    _buildBar(4, 110, colors, isHighEffort: true, isCritical: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Dummy line chart for ACWR Overlay
            Text('Acute:Chronic Workload Ratio (Overlay Concept)', style: textTheme.labelMedium),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: LineChart(
                LineChartData(
                  minY: 0.5, maxY: 2.0,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [FlSpot(1, 1.0), FlSpot(2, 1.2), FlSpot(3, 1.4), FlSpot(4, 1.6)],
                      isCurved: true,
                      color: colors.textPrimary,
                      barWidth: 2,
                      dotData: FlDotData(show: true),
                    )
                  ],
                )
              )
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBar(int x, double y, AppColors colors, {bool isHighEffort = false, bool isCritical = false}) {
    // Amber to Red effort ramp
    final barColor = isCritical ? colors.effortHigh : (isHighEffort ? colors.effortLow : colors.surface2);
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: 16,
          borderRadius: BorderRadius.zero, // Sharp geometry! No pill shapes
        )
      ],
    );
  }
}
