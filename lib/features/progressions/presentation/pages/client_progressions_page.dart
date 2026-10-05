import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ClientProgressionsPage extends StatelessWidget {
  final String clientId;
  
  const ClientProgressionsPage({Key? key, required this.clientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    final progressions = [
      {
        'title': 'Front Lever',
        'currentLevel': 2,
        'levels': [
          {'id': '1', 'name': 'Tuck Front Lever', 'criteria': 'Hold 15s'},
          {'id': '2', 'name': 'Adv. Tuck', 'criteria': 'Hold 10s'},
          {'id': '3', 'name': 'Straddle', 'criteria': 'Hold 8s'},
          {'id': '4', 'name': 'Full Front Lever', 'criteria': 'Hold 5s'},
        ]
      },
      {
        'title': 'Planche',
        'currentLevel': 1,
        'levels': [
          {'id': '1', 'name': 'Tuck Planche', 'criteria': 'Hold 10s'},
          {'id': '2', 'name': 'Adv. Tuck', 'criteria': 'Hold 8s'},
          {'id': '3', 'name': 'Straddle', 'criteria': 'Hold 5s'},
        ]
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progressions'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24),
        itemCount: progressions.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Divider(color: colors.surface2, height: 1),
        ),
        itemBuilder: (context, index) {
          final prog = progressions[index];
          final levels = prog['levels'] as List<Map<String, dynamic>>;
          final currentLevel = prog['currentLevel'] as int;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(prog['title'] as String, style: textTheme.headlineSmall),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: levels.length,
                  itemBuilder: (context, lvlIndex) {
                    final level = levels[lvlIndex];
                    final isLast = lvlIndex == levels.length - 1;
                    final isUnlocked = lvlIndex < currentLevel;
                    final isCurrent = lvlIndex == currentLevel - 1;

                    return Row(
                      children: [
                        _ClientProgressionNode(
                          levelNumber: lvlIndex + 1,
                          name: level['name'],
                          criteria: level['criteria'],
                          isUnlocked: isUnlocked,
                          isCurrent: isCurrent,
                          colors: colors,
                          textTheme: textTheme,
                        ),
                        if (!isLast)
                          Container(
                            width: 32,
                            height: 2,
                            color: isUnlocked ? colors.accent : colors.surface2,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ClientProgressionNode extends StatelessWidget {
  final int levelNumber;
  final String name;
  final String criteria;
  final bool isUnlocked;
  final bool isCurrent;
  final AppColors colors;
  final TextTheme textTheme;

  const _ClientProgressionNode({
    required this.levelNumber,
    required this.name,
    required this.criteria,
    required this.isUnlocked,
    required this.isCurrent,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrent ? colors.accent.withOpacity(0.1) : (isUnlocked ? colors.surface1 : colors.background),
        border: Border.all(
          color: isCurrent ? colors.accent : (isUnlocked ? colors.surface2 : colors.surface2.withOpacity(0.5)), 
          width: isCurrent ? 2 : 1
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lvl $levelNumber',
                style: AppTextStyles.dataStyle(colors, fontSize: 12, fontWeight: FontWeight.bold)
                    .copyWith(color: isCurrent ? colors.accent : (isUnlocked ? colors.textPrimary : colors.textSecondary)),
              ),
              if (isUnlocked && !isCurrent)
                Icon(Icons.check, size: 14, color: colors.success),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name, 
            style: textTheme.titleSmall?.copyWith(color: isUnlocked ? colors.textPrimary : colors.textSecondary),
            maxLines: 2, 
            overflow: TextOverflow.ellipsis
          ),
          const Spacer(),
          Text('Unlock:', style: textTheme.labelSmall?.copyWith(color: colors.textSecondary)),
          const SizedBox(height: 2),
          Text(
            criteria, 
            style: AppTextStyles.dataStyle(colors, fontSize: 11, fontWeight: FontWeight.w500)
                .copyWith(color: isUnlocked ? colors.textPrimary : colors.textSecondary),
          ),
        ],
      ),
    );
  }
}
