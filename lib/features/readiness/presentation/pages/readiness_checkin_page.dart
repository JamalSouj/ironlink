import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ReadinessCheckinPage extends StatefulWidget {
  const ReadinessCheckinPage({Key? key}) : super(key: key);

  @override
  State<ReadinessCheckinPage> createState() => _ReadinessCheckinPageState();
}

class _ReadinessCheckinPageState extends State<ReadinessCheckinPage> {
  int? sleep;
  int? soreness;
  int? stress;

  bool get isComplete => sleep != null && soreness != null && stress != null;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Readiness'),
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('How are you recovering?', style: textTheme.headlineSmall),
              const SizedBox(height: 48),
              
              _ReadinessRow(
                label: 'SLEEP',
                options: const ['Poor', 'Okay', 'Great'],
                selectedValue: sleep,
                colors: colors,
                textTheme: textTheme,
                onSelect: (val) => setState(() => sleep = val),
              ),
              const SizedBox(height: 32),
              
              _ReadinessRow(
                label: 'SORENESS',
                options: const ['High', 'Some', 'None'],
                selectedValue: soreness,
                colors: colors,
                textTheme: textTheme,
                onSelect: (val) => setState(() => soreness = val),
              ),
              const SizedBox(height: 32),
              
              _ReadinessRow(
                label: 'STRESS',
                options: const ['High', 'Med', 'Low'],
                selectedValue: stress,
                colors: colors,
                textTheme: textTheme,
                onSelect: (val) => setState(() => stress = val),
              ),
              
              const Spacer(),
              
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: isComplete ? () { /* Log and exit */ Navigator.pop(context); } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isComplete ? colors.accent : colors.surface2,
                    foregroundColor: isComplete ? Colors.white : colors.textSecondary,
                  ),
                  child: const Text('SUBMIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReadinessRow extends StatelessWidget {
  final String label;
  final List<String> options;
  final int? selectedValue;
  final AppColors colors;
  final TextTheme textTheme;
  final ValueChanged<int> onSelect;

  const _ReadinessRow({
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.colors,
    required this.textTheme,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.labelSmall),
        const SizedBox(height: 12),
        Row(
          children: List.generate(options.length, (index) {
            final isSelected = selectedValue == index;
            // Map 0 to effortHigh, 1 to effortLow, 2 to success for visual feedback
            final feedbackColor = index == 0 ? colors.effortHigh : (index == 1 ? colors.effortLow : colors.success);
            
            return Expanded(
              child: GestureDetector(
                onTap: () => onSelect(index),
                child: Container(
                  height: 56,
                  margin: EdgeInsets.only(right: index < options.length - 1 ? 8 : 0),
                  decoration: BoxDecoration(
                    color: isSelected ? feedbackColor.withOpacity(0.15) : colors.surface1,
                    border: Border.all(
                      color: isSelected ? feedbackColor : colors.surface2,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    options[index],
                    style: textTheme.titleSmall?.copyWith(
                      color: isSelected ? feedbackColor : colors.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
