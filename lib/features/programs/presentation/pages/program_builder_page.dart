import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProgramBuilderPage extends StatelessWidget {
  final String programId;

  const ProgramBuilderPage({Key? key, required this.programId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    // Dummy data for a 4-week macrocycle (2 wks hypertrophy, 1 wk strength, 1 wk peak/deload)
    final weeks = ['W1', 'W2', 'W3', 'W4'];
    final blocks = ['Hypertrophy', 'Hypertrophy', 'Strength', 'Peak'];
    final exercises = ['Back Squat', 'Bench Press', 'Deadlift', 'Pull-Ups'];

    // Subtle tints for blocks
    Color getBlockColor(String block) {
      if (block == 'Hypertrophy') return colors.surface1; 
      if (block == 'Strength') return colors.surface2; 
      return colors.background; // Peak
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Macrocycle Builder'),
        actions: [
          IconButton(icon: const Icon(Icons.zoom_in), onPressed: () {}),
          TextButton(onPressed: () {}, child: const Text('PUBLISH')),
        ],
      ),
      body: Column(
        children: [
          // Header Row (Weeks/Blocks)
          Row(
            children: [
              SizedBox(width: 120), // Empty space for exercise column
              ...List.generate(weeks.length, (i) {
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      color: getBlockColor(blocks[i]),
                      border: Border(
                        left: BorderSide(color: colors.surface2, width: 1),
                        bottom: BorderSide(color: colors.surface2, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(weeks[i], style: AppTextStyles.dataStyle(colors, fontSize: 12, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Text(blocks[i], style: textTheme.labelSmall?.copyWith(fontSize: 10), overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
          // Grid (Exercises x Weeks)
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, exIndex) {
                return Row(
                  children: [
                    // Exercise Name
                    Container(
                      width: 120,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: colors.surface2, width: 1)),
                      ),
                      child: Text(exercises[exIndex], style: textTheme.titleSmall),
                    ),
                    // Cells for each week
                    ...List.generate(weeks.length, (wkIndex) {
                      return Expanded(
                        child: Container(
                          height: 60, // Fixed height for rows
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: getBlockColor(blocks[wkIndex]),
                            border: Border(
                              left: BorderSide(color: colors.surface2, width: 1),
                              bottom: BorderSide(color: colors.surface2, width: 1),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // Example dummy data
                                  wkIndex < 2 ? '3x10' : (wkIndex == 2 ? '5x5' : '3x3'), 
                                  style: AppTextStyles.dataStyle(colors, fontSize: 12),
                                ),
                                Text(
                                  wkIndex < 2 ? '@ RPE 7' : (wkIndex == 2 ? '@ RPE 8' : '@ RPE 9'), 
                                  style: AppTextStyles.dataStyle(colors, fontSize: 10).copyWith(color: colors.textSecondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
