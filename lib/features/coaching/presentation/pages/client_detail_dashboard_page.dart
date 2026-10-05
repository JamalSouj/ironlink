import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../fatigue/presentation/pages/fatigue_analytics_page.dart';

class ClientDetailDashboardPage extends StatelessWidget {
  final String clientId;
  final String clientName;

  const ClientDetailDashboardPage({
    Key? key,
    required this.clientId,
    required this.clientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Hero(
                tag: 'avatar_$clientId',
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: colors.surface2,
                  child: Text(
                    clientName.substring(0, 1),
                    style: textTheme.labelLarge,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Hero(
                tag: 'name_$clientId',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(clientName),
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100), // Tabs + Summary Strip
            child: Column(
              children: [
                // Summary Strip
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: colors.surface1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SummaryItem(label: 'READINESS', value: '92%', colors: colors),
                      _SummaryItem(label: 'BLOCK', value: 'HYPERTROPHY', colors: colors),
                      _SummaryItem(label: 'ACTIVE PROG', value: '3', colors: colors),
                    ],
                  ),
                ),
                // Tabs
                TabBar(
                  indicatorColor: colors.accent,
                  labelColor: colors.textPrimary,
                  unselectedLabelColor: colors.textSecondary,
                  labelStyle: textTheme.labelMedium,
                  tabs: const [
                    Tab(text: 'PROGRAM'),
                    Tab(text: 'PROGRESSIONS'),
                    Tab(text: 'FATIGUE'),
                    Tab(text: 'LOGS'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Program Tab (no cards, plain content area)
            const Center(child: Text('Program View (Grid)')),
            // Progressions Tab
            const Center(child: Text('Progressions View (Graph)')),
            // Fatigue Tab
            const FatigueAnalyticsPage(),
            // Logs Tab
            const Center(child: Text('Logs View (List)')),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final AppColors colors;

  const _SummaryItem({required this.label, required this.value, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextStyles.dataStyle(colors, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
