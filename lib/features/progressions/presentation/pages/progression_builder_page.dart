import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProgressionBuilderPage extends StatefulWidget {
  const ProgressionBuilderPage({Key? key}) : super(key: key);

  @override
  State<ProgressionBuilderPage> createState() => _ProgressionBuilderPageState();
}

class _ProgressionBuilderPageState extends State<ProgressionBuilderPage> {
  // Dummy data representing levels in a progression
  List<Map<String, dynamic>> levels = [
    {'id': '1', 'name': 'Tuck Front Lever', 'criteria': 'Hold 15s'},
    {'id': '2', 'name': 'Adv. Tuck Front Lever', 'criteria': 'Hold 10s'},
    {'id': '3', 'name': 'Straddle Front Lever', 'criteria': 'Hold 8s'},
    {'id': '4', 'name': 'Full Front Lever', 'criteria': 'Hold 5s'},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progression Path'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('SAVE')),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: SizedBox(
          height: 160,
          child: ReorderableListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: levels.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex -= 1;
                final item = levels.removeAt(oldIndex);
                levels.insert(newIndex, item);
              });
            },
            proxyDecorator: (child, index, animation) => Material(
              color: Colors.transparent,
              child: child,
            ),
            itemBuilder: (context, index) {
              final level = levels[index];
              final isLast = index == levels.length - 1;

              return Row(
                key: ValueKey(level['id']),
                children: [
                  _ProgressionNode(
                    levelNumber: index + 1,
                    name: level['name'] as String,
                    criteria: level['criteria'] as String,
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  if (!isLast)
                    Container(
                      width: 40,
                      height: 2,
                      color: colors.surface2,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ProgressionNode extends StatelessWidget {
  final int levelNumber;
  final String name;
  final String criteria;
  final AppColors colors;
  final TextTheme textTheme;

  const _ProgressionNode({
    required this.levelNumber,
    required this.name,
    required this.criteria,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface1,
        border: Border.all(color: colors.surface2, width: 1),
        borderRadius: BorderRadius.circular(2), // Sharp geometry
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lvl $levelNumber',
            style: AppTextStyles.dataStyle(colors, fontSize: 12, fontWeight: FontWeight.bold)
                .copyWith(color: colors.accent),
          ),
          const SizedBox(height: 12),
          Text(name, style: textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          Text('Unlock:', style: textTheme.labelSmall?.copyWith(color: colors.textSecondary)),
          const SizedBox(height: 2),
          Text(
            criteria, 
            style: AppTextStyles.dataStyle(colors, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
