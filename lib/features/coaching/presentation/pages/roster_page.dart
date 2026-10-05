import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RosterPage extends StatelessWidget {
  const RosterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    // Dummy data for visual representation
    final clients = [
      {'id': '1', 'name': 'Alex Rivera', 'date': 'Today', 'readiness': 'high', 'trend': [4.0, 5.0, 4.5, 6.0, 7.5, 8.0, 7.0]},
      {'id': '2', 'name': 'Sam Cheng', 'date': 'Yesterday', 'readiness': 'low', 'trend': [8.0, 7.0, 6.0, 5.0, 4.0, 3.5, 3.0]},
      {'id': '3', 'name': 'Jordan Lee', 'date': 'Oct 2', 'readiness': 'med', 'trend': [5.0, 5.2, 5.5, 5.0, 5.3, 5.8, 6.0]},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Roster'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: clients.length,
        separatorBuilder: (context, index) => Divider(
          height: 1, 
          color: colors.surface2,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          final client = clients[index];
          final readinessColor = client['readiness'] == 'high' 
              ? colors.success 
              : client['readiness'] == 'low' 
                  ? colors.effortHigh 
                  : colors.effortLow;

          return InkWell(
            onTap: () => context.push('/coach/clients/${client['id']}?name=${client['name']}'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Readiness dot + Avatar
                  Stack(
                    children: [
                      Hero(
                        tag: 'avatar_${client['id']}',
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: colors.surface2,
                          child: Text(
                            (client['name'] as String).substring(0, 1),
                            style: textTheme.titleMedium,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: readinessColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  
                  // Name & Date
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'name_${client['id']}',
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              client['name'] as String,
                              style: textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Last: ${client['date']}',
                          style: AppTextStyles.dataStyle(colors, fontSize: 12, fontWeight: FontWeight.w400)
                              .copyWith(color: colors.textSecondary),
                        ),
                      ],
                    ),
                  ),

                  // Sparkline
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 32,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: (client['trend'] as List<double>)
                                  .asMap()
                                  .entries
                                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                                  .toList(),
                              isCurved: true,
                              color: colors.accent,
                              barWidth: 1.5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: colors.accent.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.chevron_right, color: colors.surface2, size: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
